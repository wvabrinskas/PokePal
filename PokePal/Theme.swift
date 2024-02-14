//
//  Theme.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//

import Foundation
import SwiftUI


enum Colors {
  case primary
  case secondary
  case error
  case success
  case background
  case textPrimary
  case accessory
  case secondaryAccessory
  case textDark
  case buttonColorTypePriority
  
  var name: String {
    switch self {
    case .primary:
      return "PrimaryColor"
    case .secondary:
      return "SecondaryColor"
    case .error:
      return "ErrorColor"
    case .success:
      return "SuccessColor"
    case .background:
      return "background"
    case .textPrimary:
      return "textPrimary"
    case .accessory:
      return "Accessory"
    case .secondaryAccessory:
      return "SecondaryAccessory"
    case .textDark:
      return "textDark"
    case .buttonColorTypePriority:
      return "buttonPriority"
    }
  }
}


extension Color {
  static func app(_ colors: Colors) -> Color {
    return Color(colors.name)
  }
}

protocol Theme {
  associatedtype A: Assets
  var assets: A { get }
  var primaryColor: Color { get }


  func appColor(colors: Colors) -> Color
}


public protocol Images: AnyObject {
  associatedtype Names: RawRepresentable<String> & ExpressibleByStringLiteral
  subscript(dynamicMember member: Names) -> Image? { get }
}

public protocol Assets {
  associatedtype I: Images
  var images: I { get }
}

public enum LaunchImageNames: String, ExpressibleByStringLiteral {
  public typealias StringLiteralType = String
  
  case unknown
  case whiteLogo
  
  public init(stringLiteral value: String) {
    if let newInit = Self.init(rawValue: value) {
      self = newInit
      return
    }
    
    self = .unknown
  }
}

@dynamicMemberLookup
public final class LaunchImages: Images {
  public typealias Names = LaunchImageNames
  
  public subscript(dynamicMember member: Names) -> Image? {
    Image(member.rawValue)
  }
}

public final class LaunchAssets: Assets {
  public let images = LaunchImages()
}

