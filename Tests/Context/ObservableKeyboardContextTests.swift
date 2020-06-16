//
//  ObservableKeyboardContextTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-06-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKitSwiftUI
import UIKit

@available(iOS 13, *)
class ObservableKeyboardContextTests: QuickSpec {

    override func spec() {
        
        describe("context") {
            
            it("can be created with params") {
                let context = ObservableKeyboardContext(keyboardType: .images)
                expect(context.keyboardType).to(equal(.images))
            }
            
            it("can be created with context") {
                let standard = StandardKeyboardContext(keyboardType: .email)
                standard.hasFullAccess = true
                standard.needsInputModeSwitchKey = true
                let context = ObservableKeyboardContext(from: standard)
                expect(context.keyboardType).to(equal(.email))
                expect(context.hasFullAccess).to(beTrue())
                expect(context.needsInputModeSwitchKey).to(beTrue())
            }
        }
    }
}
