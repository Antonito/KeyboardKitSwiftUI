//
//  SystemKeyboardButtonRowItem.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-12-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view is meant to be used within a `SystemKeyboard` and
 will apply the correct frames and paddings to make the view
 behave well within an automatically generated keyboard view.
 
 This view wraps a `SystemKeyboardButtonContent` and adjusts
 it to be used within a keyboard row. This involves applying
 height and paddings and new gestures in a way that make the
 buttons seem separated while actually sticking together.
 */
public struct SystemKeyboardButtonRowItem<Content: View>: View {
    
    public init(
        action: KeyboardAction,
        buttonContent: Content,
        dimensions: SystemKeyboardDimensions = SystemKeyboardDimensions(),
        keyboardSize: CGSize) {
        self.action = action
        self.buttonContent = buttonContent
        self.dimensions = dimensions
        self.keyboardSize = keyboardSize
    }
    
    private let action: KeyboardAction
    private let buttonContent: Content
    private let dimensions: SystemKeyboardDimensions
    private let keyboardSize: CGSize
    
    @EnvironmentObject var context: ObservableKeyboardContext
    
    public var body: some View {
        buttonContent
            .frame(maxWidth: .infinity)
            .frame(height: dimensions.buttonHeight - dimensions.buttonInsets.top - dimensions.buttonInsets.bottom)
            .applyWidth(for: action, from: dimensions, keyboardWidth: keyboardSize.width)
            .standardButtonStyle(for: action, context: context)
            .padding(dimensions.buttonInsets)
            .frame(height: dimensions.buttonHeight)
            .background(Color.clearInteractable)
            .keyboardAction(action, context: context)
    }
}

private extension View {
    
    @ViewBuilder
    func applyWidth(
        for action: KeyboardAction,
        from dimensions: SystemKeyboardDimensions,
        keyboardWidth: CGFloat) -> some View {
        if let width = width(for: action, from: dimensions, keyboardWidth: keyboardWidth) {
            self.frame(width: width)
        } else {
            self
        }
    }
    
    func width(
        for action: KeyboardAction,
        from dimensions: SystemKeyboardDimensions,
        keyboardWidth: CGFloat) -> CGFloat? {
        switch action {
        case .shift, .backspace: return dimensions.shortButtonWidth
        case .space: return keyboardWidth * 0.5
        default: return nil
        }
    }
    
    func width(for keyboardType: KeyboardType, from dimensions: SystemKeyboardDimensions) -> CGFloat? {
        switch keyboardType {
        case .numeric, .alphabetic: return dimensions.longButtonWidth
        default: return dimensions.shortButtonWidth
        }
    }
}

private extension KeyboardAction {
    
    var isShift: Bool {
        switch self {
        case .shift: return true
        default: return false
        }
    }
}
