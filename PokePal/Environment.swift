//
//  Environment.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//

import Foundation
import CoreData
import Combine
import SwiftUI
import HuddleArch

struct StateKey: EnvironmentKey {
  static let defaultValue: RootModuleHolder = RootModuleHolder(context: RootModuleHolderContext(),
                                                               component: RootComponentImpl())
}

extension EnvironmentValues {
  var rootModule: RootModuleHolder {
    get { self[StateKey.self] }
    set { self[StateKey.self] = newValue }
  }
}

