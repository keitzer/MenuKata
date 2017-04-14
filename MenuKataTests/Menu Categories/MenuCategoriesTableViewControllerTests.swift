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
            var mockIndicator: MockProgressIndicator!
            var mockViewModel: MockMenuCategoriesViewModel!
            var mockNavController: MockUINavigationController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                subject = storyboard.instantiateViewController(withIdentifier: "MenuCategoriesTableViewController") as? MenuCategoriesTableViewController
                mockNavController = MockUINavigationController(rootViewController: subject)
                
                mockIndicator = MockProgressIndicator()
                subject.progressIndicator = mockIndicator
                mockViewModel = MockMenuCategoriesViewModel()
                subject.viewModel = mockViewModel
            }
            
            it("has the navigation title set to Categories") {
                expect(subject.navigationItem.title).to(equal("Categories"))
            }
            
            it("uses the global progress indicator") {
                subject = MenuCategoriesTableViewController()
                expect(subject.progressIndicator).to(beIdenticalTo(GlobalProgressIndicator.shared))
            }
            
            describe("view did load") {
                beforeEach {
                    _ = subject.view
                }
                
                it("shows the progress indicator") {
                    expect(mockIndicator).to(invoke(MockProgressIndicator.InvocationKeys.showWithStatus, withParameter: "Loading Menu"))
                }
                
                it("calls into the view model for making the Category call") {
                    expect(mockViewModel).to(invoke(MockMenuCategoriesViewModel.InvocationKeys.loadCategories))
                }
            }
            
            describe("refresh button pressed") {
                beforeEach {
                    subject.refreshPressed()
                }
                
                it("shows the progress indicator") {
                    expect(mockIndicator).to(invoke(MockProgressIndicator.InvocationKeys.showWithStatus, withParameter: "Loading Menu"))
                }
                
                it("calls into the view model for making the Category call") {
                    expect(mockViewModel).to(invoke(MockMenuCategoriesViewModel.InvocationKeys.loadCategories))
                }
            }
            
            describe("number of rows in section") {
                it("returns the number of menu categories that the view model contains") {
                    subject.viewModel.categories = [
                        MenuCategory(categoryName: "", menuItems: []),
                        MenuCategory(categoryName: "", menuItems: []),
                        MenuCategory(categoryName: "", menuItems: [])
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
                        MenuCategory(categoryName: expectedCell1Text, menuItems: []),
                        MenuCategory(categoryName: expectedCell2Text, menuItems: [])
                    ]
                    
                    let cell1 = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                    let cell2 = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 1, section: 0))
                    
                    expect(cell1.textLabel?.text).to(equal(expectedCell1Text))
                    expect(cell2.textLabel?.text).to(equal(expectedCell2Text))
                }
            }
            
            describe("tapped cell") {
                var expectedItemList: [MenuItem]!
                beforeEach {
                    expectedItemList = [
                        MenuItem(itemName: "Name1", imageName: "Image1", price: 1),
                        MenuItem(itemName: "Name2", imageName: "Image2", price: 2)
                    ]
                    subject.viewModel.categories = [
                        MenuCategory(categoryName: "CatName", menuItems: expectedItemList)
                    ]
                    
                    _ = subject.view
                    mockNavController.reset()
                    
                    subject.tableView(subject.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
                }
                
                it("transitions to the next view controller") {
                    expect(mockNavController).to(invoke(MockUINavigationController.InvocationKeys.pushViewController))
                }
                
                it("sets the view model item list") {
                    let pushedVC: MenuItemsTableViewController? = mockNavController.parameter(for: MockUINavigationController.InvocationKeys.pushViewController, atParameterIndex: 0)
                    
                    expect(pushedVC?.viewModel.menuItems).to(equal(expectedItemList))
                }
                
                it("sets the title of the nav item to the name of the currently selected category") {
                    let pushedVC: MenuItemsTableViewController? = mockNavController.parameter(for: MockUINavigationController.InvocationKeys.pushViewController, atParameterIndex: 0)
                    
                    expect(pushedVC?.navigationItem.title).to(equal("CatName"))
                }
            }
            
            describe("menu categories loaded successfully") {
                var mockTableView: MockUITableView!
                beforeEach {
                    mockTableView = MockUITableView()
                    subject.tableView = mockTableView
                    
                    subject.viewDidLoad()
                    
                    let successBlock: (()->Void)? = mockViewModel.parameter(for: MockMenuCategoriesViewModel.InvocationKeys.loadCategories, atParameterIndex: 0)
                    
                    successBlock?()
                }
                
                it("dismisses the progress indicator") {
                    expect(mockIndicator).to(invoke(MockProgressIndicator.InvocationKeys.dismiss))
                }
                
                it("reloads the table view") {
                    expect(mockTableView).to(invoke(MockUITableView.InvocationKeys.reloadData))
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
                    expect(mockIndicator).to(invoke(MockProgressIndicator.InvocationKeys.dismiss))
                }
                
                it("does something with the failure message") {
                    // ???
                }
            }
        }
    }
}
