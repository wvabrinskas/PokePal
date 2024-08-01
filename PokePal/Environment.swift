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
  @MainActor static let defaultValue: RootModuleHolder = RootBuilder.build(parentComponent: EmptyComponent(),
                                                                           holder: nil,
                                                                           context: .init())
}

extension EnvironmentValues {
  var rootModule: RootModuleHolder {
    get { self[StateKey.self] }
    set { self[StateKey.self] = newValue }
  }
}

