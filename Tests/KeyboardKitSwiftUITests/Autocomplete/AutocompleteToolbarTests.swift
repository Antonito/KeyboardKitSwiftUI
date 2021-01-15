//
//  AutocompleteToolbarTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2021-01-15.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import KeyboardKitSwiftUI

class AutocompleteToolbarTests: QuickSpec {
    
    override func spec() {
        
        var proxy: MockTextDocumentProxy!
        var context: MockKeyboardContext!
        var actionHandler: MockKeyboardActionHandler!
        
        beforeEach {
            proxy = MockTextDocumentProxy()
            context = MockKeyboardContext()
            actionHandler = MockKeyboardActionHandler()
            context.actionHandler = actionHandler
        }
        
        describe("action for suggestion") {
            
            it("sends suggestion to proxy") {
                let action = AutocompleteToolbar.action(for: "Hello", context: context)
                action()
                action()
                let inv = actionHandler.invokations(of: actionHandler.handleRef)
                expect(inv.count).to(equal(2))
                expect(inv[0].arguments.0).to(equal(.tap))
                expect(inv[0].arguments.1).to(equal(.character("Hello ")))
            }
        }
        
        describe("replacement for suggestion") {
            
            it("adds a space when needed") {
                let result = AutocompleteToolbar.replacement(for: "Hello", proxy: proxy)
                expect(result).to(equal("Hello "))
            }
            
            it("does not add an additional space if the suggestion replacement ends with one") {
                let result = AutocompleteToolbar.replacement(for: "Hello ", proxy: proxy)
                expect(result).to(equal("Hello "))
            }
            
            it("does not add an additional space if the text after the input starts with one") {
                proxy.documentContextBeforeInput = " world!"
                let result = AutocompleteToolbar.replacement(for: "Hello ", proxy: proxy)
                expect(result).to(equal("Hello "))
            }
        }
    }
}
