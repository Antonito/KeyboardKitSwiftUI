//
//  View+ButtonTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKit
import KeyboardKitSwiftUI
import SwiftUI

class View_SystemKeyboardStylesTests: QuickSpec {

    override func spec() {
        
        let controller = KeyboardInputViewController()
        let actionHandler = StandardKeyboardActionHandler(inputViewController: controller)
        let context = StandardKeyboardContext(controller: controller, actionHandler: actionHandler, keyboardType: .email)
        
        describe("standard button style") {
            
            it("is defined") {
                let result = Text("").standardButtonStyle(for: .backspace, context: context)
                expect(result).toNot(beNil())
            }
        }
            
        describe("standard button background") {
            
            it("is defined") {
                let background = Text("").standardButtonBackground(for: .backspace, context: context)
                expect(background).toNot(beNil())
            }
        }
        
        describe("standard button font") {
            
            it("is defined") {
                let font = Text("").standardButtonFont(for: .backspace, context: context)
                expect(font).toNot(beNil())
            }
        }
        
        describe("standard button foreground") {
            
            it("is defined") {
                let foreground = Text("").standardButtonForeground(for: context)
                expect(foreground).toNot(beNil())
            }
        }
        
        describe("standard button shadow") {
            
            it("is defined") {
                let value = Text("").standardButtonShadow(for: context)
                expect(value).toNot(beNil())
            }
        }
    }
}
