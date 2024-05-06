//
//  
//  CameraModule.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//
//

import Foundation
import HuddleArch
import HuddleMacros
import AVFoundation
import Logger
import CoreImage
import UIKit

public protocol CameraModuleComponent: Component {
  // add dependencies here
}

@ComponentImpl
public class CameraModuleComponentImpl: Component, CameraModuleComponent {
}

public protocol CameraSupporting {
  var previewStream: AsyncStream<CIImage> { get }
  var cameraViewController: CameraViewController { get }
  func start() async
  func stop()
}

public final class CameraModule: ModuleObject<RootModuleHolderContext, CameraModuleComponent,  CameraRouter>, CameraSupporting, Logger {
  public var logLevel: LogLevel = .medium
  public let cameraViewController: CameraViewController = CameraViewController()
  public lazy var previewStream: AsyncStream<CIImage> = {
    AsyncStream { continuation in
      addToPreviewStream = { ciImage in
        if !self.isPreviewPaused {
          continuation.yield(ciImage)
        }
      }
    }
  }()
  
  private let captureSession = AVCaptureSession()
  private var isCaptureSessionConfigured = false
  private var deviceInput: AVCaptureDeviceInput?
  private var photoOutput: AVCapturePhotoOutput?
  private var videoOutput: AVCaptureVideoDataOutput?
  private var sessionQueue: DispatchQueue!
  private var allCaptureDevices: [AVCaptureDevice] {
    AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInTrueDepthCamera,
                                                   .builtInDualCamera,
                                                   .builtInDualWideCamera,
                                                   .builtInWideAngleCamera,
                                                   .builtInDualWideCamera],
                                     mediaType: .video,
                                     position: .unspecified).devices
  }
  
  private var frontCaptureDevices: [AVCaptureDevice] {
    allCaptureDevices
      .filter { $0.position == .front }
  }
  
  private var backCaptureDevices: [AVCaptureDevice] {
    allCaptureDevices
      .filter { $0.position == .back }
  }
  
  private var captureDevices: [AVCaptureDevice] {
    var devices = [AVCaptureDevice]()
    if let backDevice = backCaptureDevices.first {
      devices += [backDevice]
    }
    if let frontDevice = frontCaptureDevices.first {
      devices += [frontDevice]
    }
    return devices
  }
  
  private var availableCaptureDevices: [AVCaptureDevice] {
    captureDevices
      .filter( { $0.isConnected } )
      .filter( { !$0.isSuspended } )
  }
  
  private var captureDevice: AVCaptureDevice? {
    didSet {
      guard let captureDevice = captureDevice else { return }
      log(type: .success, message: "Using capture device: \(captureDevice.localizedName)")
      sessionQueue.async {
        self.updateSessionForCaptureDevice(captureDevice)
      }
    }
  }
  
  private var isRunning: Bool {
    captureSession.isRunning
  }
  
  private var isUsingFrontCaptureDevice: Bool {
    guard let captureDevice = captureDevice else { return false }
    return frontCaptureDevices.contains(captureDevice)
  }
  
  private var isUsingBackCaptureDevice: Bool {
    guard let captureDevice = captureDevice else { return false }
    return backCaptureDevices.contains(captureDevice)
  }
  
  private var addToPreviewStream: ((CIImage) -> Void)?
  
  private var isPreviewPaused = false
  
  public required init(holder: ModuleHolding?, context: Context, component: Component) {
    super.init(holder: holder, context: context, component: component)
    
    initialize()
  }
  
  public func start() async {
    let authorized = await checkAuthorization()
    guard authorized else {
      log(type: .error, message: "Camera access was not authorized.")
      return
    }
    
    if isCaptureSessionConfigured {
      if !captureSession.isRunning {
        sessionQueue.async { [self] in
          self.captureSession.startRunning()
          Task { @MainActor in
            self.addLayerToViewController()
          }
        }
      }
      return
    }
    
    sessionQueue.async { [self] in
      self.configureCaptureSession { success in
        guard success else { return }
        self.captureSession.startRunning()
        Task { @MainActor in
          self.addLayerToViewController()
        }
      }
    }
  }

  public func stop() {
    guard isCaptureSessionConfigured else { return }
    
    if captureSession.isRunning {
      sessionQueue.async {
        self.captureSession.stopRunning()
      }
    }
    
    cameraViewController.end()
  }
  
  // MARK: Private

  private func initialize() {
    sessionQueue = DispatchQueue(label: "session queue")
    captureDevice = availableCaptureDevices.first ?? AVCaptureDevice.default(for: .video)
    
    do {
      try captureDevice?.lockForConfiguration()
      captureDevice?.focusMode = .continuousAutoFocus
      captureDevice?.unlockForConfiguration()
    } catch {
      print(error.localizedDescription)
    }
  }
  
  private func configureCaptureSession(completionHandler: (_ success: Bool) -> Void) {
    
    var success = false
    
    self.captureSession.beginConfiguration()
    
    defer {
      self.captureSession.commitConfiguration()
      completionHandler(success)
    }
    
    guard
      let captureDevice = captureDevice,
      let deviceInput = try? AVCaptureDeviceInput(device: captureDevice)
    else {
      log(type: .error, message: "Failed to obtain video input.")
      return
    }
    
    let photoOutput = AVCapturePhotoOutput()
    
    captureSession.sessionPreset = AVCaptureSession.Preset.photo
    
    let videoOutput = AVCaptureVideoDataOutput()
    videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoDataOutputQueue"))
    
    guard captureSession.canAddInput(deviceInput) else {
      log(type: .error, message: "Unable to add device input to capture session.")
      return
    }
    guard captureSession.canAddOutput(photoOutput) else {
      log(type: .error, message: "Unable to add photo output to capture session.")
      return
    }
    guard captureSession.canAddOutput(videoOutput) else {
      log(type: .error, message: "Unable to add video output to capture session.")
      return
    }
    
    captureSession.addInput(deviceInput)
    captureSession.addOutput(videoOutput)
    captureSession.addOutput(photoOutput)
    
    self.deviceInput = deviceInput
    self.videoOutput = videoOutput
    self.photoOutput = photoOutput
    
    updateVideoOutputConnection()
    
    isCaptureSessionConfigured = true
    
    success = true
  }
  
  private func checkAuthorization() async -> Bool {
    switch AVCaptureDevice.authorizationStatus(for: .video) {
    case .authorized:
      log(type: .success, message: "Camera access authorized.")
      return true
    case .notDetermined:
      log(type: .success, message: "Camera access not determined.")
      sessionQueue.suspend()
      let status = await AVCaptureDevice.requestAccess(for: .video)
      sessionQueue.resume()
      return status
    case .denied:
      log(type: .error, message: "Camera access denied.")
      return false
    case .restricted:
      log(type: .error, message: "Camera access restricted.")
      return false
    @unknown default:
      return false
    }
  }
  
  private func deviceInputFor(device: AVCaptureDevice?) -> AVCaptureDeviceInput? {
    guard let validDevice = device else { return nil }
    do {
      return try AVCaptureDeviceInput(device: validDevice)
    } catch let error {
      log(type: .error, message: "Error getting capture device input: \(error.localizedDescription)")
      return nil
    }
  }
  
  private func updateSessionForCaptureDevice(_ captureDevice: AVCaptureDevice) {
    guard isCaptureSessionConfigured else { return }
    
    captureSession.beginConfiguration()
    defer { captureSession.commitConfiguration() }
    
    for input in captureSession.inputs {
      if let deviceInput = input as? AVCaptureDeviceInput {
        captureSession.removeInput(deviceInput)
      }
    }
    
    if let deviceInput = deviceInputFor(device: captureDevice) {
      if !captureSession.inputs.contains(deviceInput), captureSession.canAddInput(deviceInput) {
        captureSession.addInput(deviceInput)
      }
    }
    
    updateVideoOutputConnection()
  }
  
  private func updateVideoOutputConnection() {
    if let videoOutput = videoOutput, let videoOutputConnection = videoOutput.connection(with: .video) {
      if videoOutputConnection.isVideoMirroringSupported {
        videoOutputConnection.isVideoMirrored = isUsingFrontCaptureDevice
      }
    }
  }

  @MainActor
  private func addLayerToViewController() {
    let layer = AVCaptureVideoPreviewLayer(session: captureSession)
    let xStart = (CGFloat(layer.frame.size.width) / 2) - (CGFloat(64))
    let yStart = (CGFloat(layer.frame.size.height) / 2) - (CGFloat(64))
    
    let rect = CGRect(x: xStart,
                      y: yStart,
                      width: CGFloat(64 * 4),
                      height: CGFloat(64 * 4))
    
    layer.frame = rect
    
    cameraViewController.setPreviewLayer(layer: layer)
  }
  
  private func switchCaptureDevice() {
    if let captureDevice = captureDevice, let index = availableCaptureDevices.firstIndex(of: captureDevice) {
      let nextIndex = (index + 1) % availableCaptureDevices.count
      self.captureDevice = availableCaptureDevices[nextIndex]
    } else {
      self.captureDevice = AVCaptureDevice.default(for: .video)
    }
  }
  
}


extension CameraModule: AVCaptureVideoDataOutputSampleBufferDelegate {
  
  public func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    guard let pixelBuffer = sampleBuffer.imageBuffer else { return }
    
    if connection.isVideoRotationAngleSupported(90) {
      connection.videoRotationAngle = 90
    }
    
    let context = CIContext()
    
    let ciImg = CIImage(cvPixelBuffer: pixelBuffer)
    
    if let ref = context.createCGImage(ciImg, from: ciImg.extent) {
      
      let xStart = (CGFloat(ciImg.extent.size.width) / 2) - (CGFloat(64))
      let yStart = (CGFloat(ciImg.extent.size.height) / 2) - (CGFloat(64))
      
      var ref = ref
      let rect =  CGRect(x: xStart,
                         y: yStart,
                         width: CGFloat(64 * 4),
                         height: CGFloat(64 * 4))
      
      if let crop = ref.cropping(to: rect) {
        ref = crop
      }
      
      addToPreviewStream?(CIImage(cgImage: ref))
    }
  }
}

