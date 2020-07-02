//
//  KeyboardActionTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit

extension KeyboardAction {
    
    static var testActions: [KeyboardAction] {
        [
            .none,
            .dismissKeyboard,
            .character(""),
            .command,
            .custom(name: ""),
            .dictation,
            .done,
            .escape,
            .emoji(""),
            .emojiCategory(.smileys),
            .function,
            .image(description: "", keyboardImageName: "", imageName: ""),
            .keyboardType(.email),
            .moveCursorBackward,
            .moveCursorForward,
            .newLine,
            .nextKeyboard,
            .option,
            .search,
            .shift(currentState: .lowercased),
            .shift(currentState: .uppercased),
            .shift(currentState: .capsLocked),
            .space,
            .systemImage(description: "", keyboardImageName: "", imageName: ""),
            .tab
        ]
    }
}
