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
            
            describe("number of rows in section") {
                it("returns the number of menu categories that the view model contains") {
                    subject.viewModel.categories = [
                        MenuCategory(categoryName: "", imageName: ""),
                        MenuCategory(categoryName: "", imageName: ""),
                        MenuCategory(categoryName: "", imageName: "")
                    ]
                    
                    let count = subject.tableView(subject.tableView, numberOfRowsInSection: 0)
                    
                    expect(count).to(equal(3))
                }
            }
            
            describe("cell for row at index path") {
                it("sets the text label equal to the respective menu item's category name") {
                    let expectedCell1Text = "Name 1"
                    let expectedCell2Text = "Other Name"
                    
                    subject.viewModel.categories = [
                        MenuCategory(categoryName: expectedCell1Text, imageName: ""),
                        MenuCategory(categoryName: expectedCell2Text, imageName: "")
                    ]
                    
                    let cell1 = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                    let cell2 = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 1, section: 0))
                    
                    expect(cell1.textLabel?.text).to(equal(expectedCell1Text))
                    expect(cell2.textLabel?.text).to(equal(expectedCell2Text))
                }
            }
            
            describe("menu categories loaded successfully") {
                beforeEach {
                    let mockViewModel = MockMenuCategoriesViewModel()
                    subject.viewModel = mockViewModel
                    
                    _ = subject.view
                    
                    let successBlock: (()->Void)? = mockViewModel.parameter(for: MockMenuCategoriesViewModel.InvocationKeys.loadCategories, atParameterIndex: 0)
                    
                    successBlock?()
                }
                
                it("dismisses the progress indicator") {
                    
                }
                
                it("reloads the table view") {
                    
                }
            }
            
            describe("menu categories load failed") {
                beforeEach {
                    let mockViewModel = MockMenuCategoriesViewModel()
                    subject.viewModel = mockViewModel
                    
                    _ = subject.view
                    
                    let failBlock: ((String)->Void)? = mockViewModel.parameter(for: MockMenuCategoriesViewModel.InvocationKeys.loadCategories, atParameterIndex: 1)
                    
                    failBlock?("Message")
                }
                
                it("dismisses the progress indicator") {
                    
                }
                
                it("does something with the failure message") {
                    
                }
            }
        }
    }
}
