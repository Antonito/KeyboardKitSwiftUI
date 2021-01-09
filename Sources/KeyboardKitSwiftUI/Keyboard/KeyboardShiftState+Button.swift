//
//  KeyboardShiftState+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 The `System` extensions help you create keyboard extensions
 that mimic native iOS system keyboards.
 */
public extension KeyboardShiftState {
    
    /**
     The image that can be used to indicate that this is the
     current shift state.
     */
    var standardButtonImage: Image {
        switch self {
        case .capsLocked: return .shiftCapslocked
        case .lowercased: return .shiftLowercased
        case .uppercased: return .shiftUppercased
        }
    }
}
