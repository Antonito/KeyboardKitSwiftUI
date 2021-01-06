//
//  MockKeyboardContext.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import KeyboardKit
import UIKit

class MockKeyboardContext: KeyboardContext {
    
    var controller: KeyboardInputViewController = KeyboardInputViewController()
    
    var device: UIDevice = .current
    
    var actionHandler: KeyboardActionHandler = MockKeyboardActionHandler()
    var emojiCategory: EmojiCategory = .frequent
    var keyboardBehavior: KeyboardBehavior = StandardKeyboardBehavior()
    lazy var keyboardLayoutProvider: KeyboardLayoutProvider = { fatalError("Not implemented yet") }()
    lazy var keyboardInputSetProvider: KeyboardInputSetProvider = { fatalError("Not implemented yet") }()
    var keyboardType: KeyboardType = .alphabetic(.lowercased)
    
    var deviceOrientation: UIInterfaceOrientation = .portrait
    var hasDictationKey = false
    var hasFullAccess = false
    var keyboardAppearanceValue: UIKeyboardAppearance = .light
    var keyboardAppearance: UIKeyboardAppearance = .dark
    var locale: Locale = .current
    var needsInputModeSwitchKey = false
    var primaryLanguage: String?
    var textDocumentProxy: UITextDocumentProxy = UIInputViewController().textDocumentProxy
    var textInputMode: UITextInputMode?
    var traitCollection: UITraitCollection = .current
    var userInterfaceStyle: UIUserInterfaceStyle = .light
}
