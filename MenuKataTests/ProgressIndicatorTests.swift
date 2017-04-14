//
//  SVProgressHUDWrapperTests.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SVProgressHUD
@testable import MenuKata

class SVProgressHUDWrapperTests: QuickSpec {
    override func spec() {
        describe("SVProgressHUD Wrapper") {
            
            it("only creates one instance") {
                let someInstance = ProgressIndicator.shared
                let otherInstance = ProgressIndicator.shared
                
                expect(someInstance).to(beIdenticalTo(otherInstance))
            }
            
            it("showWithStatus shows the progress HUD") {
                ProgressIndicator.shared.show(with: "Some status")
                
                expect(SVProgressHUD.isVisible()).to(beTrue())
            }
            
            it("dismiss hides the progress HUD") {
                SVProgressHUD.show(withStatus: "Some status")
                
                ProgressIndicator.shared.dismiss()
                
                expect(SVProgressHUD.isVisible()).to(beFalse())
            }
        }
    }
}
