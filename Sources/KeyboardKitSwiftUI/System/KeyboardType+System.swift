//
//  KeyboardType+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 The "system" extensions are just suggestions if you want to
 mimic system keyboards. You do not have to use them in your
 custom keyboards.
 */
public extension KeyboardType {
    
    /**
     The button image that should be used by a system button
     that applies this keyboard type, if any.
     */
    var systemKeyboardButtonImage: Image? {
        switch self {
        case .alphabetic(let state): return state.systemKeyboardButtonImage
        case .email: return .email
        case .emojis: return .emoji
        case .images: return .images
        default: return nil    
        }
    }
}
