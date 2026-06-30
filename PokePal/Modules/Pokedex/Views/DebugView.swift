//
//  DebugView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//

import SwiftUI
import UniformTypeIdentifiers

@Observable
public class DebugViewModel {
  var inferenceImage: Image?
  
  init(inferenceImage: Image? = nil) {
    self.inferenceImage = inferenceImage
  }
}

struct DebugView: View {
  
  let viewModel: DebugViewModel
  @Binding var imageProperties: ImageProperties
  var modelName: String
  var onImportModel: (URL) -> Void
  
  @State private var showImporter = false
  @State private var importError: String?
  
  private static let smodelType = UTType(filenameExtension: "smodel") ?? .data
  
  var body: some View {
    VStack {
      Text("last image")
      viewModel.inferenceImage?
        .resizable()
        .frame(width: 64 * 4.7, height: 64 * 4.7)
      
      Toggle(isOn: $imageProperties.preProcess) {
        Text("Pre process")
      }
      .padding([.leading, .trailing])
      .padding(.bottom, 16)
      
      Text("Contrast - \(String(format: "%.1f", imageProperties.contrast))")
      Slider(value: $imageProperties.contrast, in: 0...5)
        .padding([.leading, .trailing])
        .padding(.bottom, 16)
      
      Text("Sharpness - \(String(format: "%.1f", imageProperties.sharpness))")
      Slider(value: $imageProperties.sharpness, in: 0...5)
        .padding([.leading, .trailing])
        .padding(.bottom, 16)
      
      modelSection
    }
  }
  
  private var modelSection: some View {
    VStack(spacing: 8) {
      Text("Model")
        .font(.headline)
      
      Text(modelName.isEmpty ? "No model loaded" : modelName)
        .font(.subheadline)
        .multilineTextAlignment(.center)
        .foregroundColor(.secondary)
      
      Button {
        showImporter = true
      } label: {
        Label("Import model", systemImage: "square.and.arrow.down")
      }
      .buttonStyle(.borderedProminent)
      
      if let importError {
        Text(importError)
          .font(.caption)
          .foregroundColor(.red)
          .multilineTextAlignment(.center)
      }
    }
    .padding([.leading, .trailing])
    .fileImporter(isPresented: $showImporter,
                  allowedContentTypes: [DebugView.smodelType],
                  allowsMultipleSelection: false) { result in
      switch result {
      case .success(let urls):
        guard let url = urls.first else { return }
        importError = nil
        onImportModel(url)
      case .failure(let error):
        importError = error.localizedDescription
      }
    }
  }
}

#Preview {
  DebugView(viewModel: .init(inferenceImage: .init(.pokeball)),
            imageProperties: .constant(.init(sharpness: 0.8,
                                             contrast: 1.5,
                                             preProcess: true)),
            modelName: "pokemon-all-classifier_minified",
            onImportModel: { _ in })
}
