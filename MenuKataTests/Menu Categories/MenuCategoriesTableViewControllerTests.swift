//
//  MenuCategoriesTableViewControllerTests.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MenuKata

class MenuCategoriesTableViewControllerTests: QuickSpec {
    override func spec() {
        describe("MenuCategoriesTableViewControllerTests") {
            var subject: MenuCategoriesTableViewController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                subject = storyboard.instantiateViewController(withIdentifier: "MenuCategoriesTableViewController") as? MenuCategoriesTableViewController
            }
            
            it("uses the global progress indicator") {
                expect(subject.progressIndicator).to(beIdenticalTo(GlobalProgressIndicator.shared))
            }
            
            describe("view did load") {
                it("shows the progress indicator") {
                    let mockIndicator = MockProgressIndicator()
                    subject.progressIndicator = mockIndicator
                    
                    _ = subject.view
                    
                    expect(mockIndicator).to(invoke(MockProgressIndicator.InvocationKeys.showWithStatus, withParameter: "Loading Categories"))
                }
                
                it("calls into the view model for making the Category call") {
                    let mockViewModel = MockMenuCategoriesViewModel()
                    subject.viewModel = mockViewModel
                    
                    _ = subject.view
                    
                    expect(mockViewModel).to(invoke(MockMenuCategoriesViewModel.InvocationKeys.loadCategories))
                }
            }
        }
    }
}
