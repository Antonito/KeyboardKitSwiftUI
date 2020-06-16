//
//  ObservableKeyboardContext.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import UIKit

/**
 This context provides observable properties to the keyboard
 extension. It's used by default when the keyboard extension
 is setup to use SwiftUI.
 */
public class ObservableKeyboardContext: KeyboardContext, ObservableObject {
    
    public init(keyboardType: KeyboardType = .alphabetic(.lowercased)) {
        self.keyboardType = keyboardType
    }
    
    public init(from context: KeyboardContext) {
        hasFullAccess = context.hasFullAccess
        keyboardType = context.keyboardType
        needsInputModeSwitchKey = context.needsInputModeSwitchKey
    }
    
    @Published public var hasFullAccess = false
    @Published public var keyboardType: KeyboardType
    @Published public var needsInputModeSwitchKey = false
}
