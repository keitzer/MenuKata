//
//  MenuItemsTableViewControllerTests.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/14/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MenuKata

class MenuItemsTableViewControllerTests: QuickSpec {
    override func spec() {
        describe("MenuItemsTableViewController") {
            var subject: MenuItemsTableViewController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                subject = storyboard.instantiateViewController(withIdentifier: "MenuItemsTableViewController") as? MenuItemsTableViewController
                _ = UINavigationController(rootViewController: subject)
            }
            
            describe("number of rows in section") {
                it("returns the number of menu items that the view model contains") {
                    subject.viewModel.menuItems = [
                        MenuItem(itemName: "", imageName: "", price: 1),
                        MenuItem(itemName: "", imageName: "", price: 1)
                    ]
                    
                    let count = subject.tableView(subject.tableView, numberOfRowsInSection: 0)
                    
                    expect(count).to(equal(2))
                }
            }
            
            describe("cell for row at index path") {
                it("sets the text label equal to the respective menu item's name") {
                    let expectedCell1Text = "Name 1"
                    let expectedCell2Text = "Other Name"
                    
                    subject.viewModel.menuItems = [
                        MenuItem(itemName: expectedCell1Text, imageName: "", price: 1),
                        MenuItem(itemName: expectedCell2Text, imageName: "", price: 1)
                    ]
                    
                    let cell1 = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                    let cell2 = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 1, section: 0))
                    
                    expect(cell1.textLabel?.text).to(equal(expectedCell1Text))
                    expect(cell2.textLabel?.text).to(equal(expectedCell2Text))
                }
            }
            
            describe("tapped cell") {
                beforeEach {
                    let expectedItemList = [
                        MenuItem(itemName: "Name1", imageName: "Image1", price: 1),
                        MenuItem(itemName: "Name2", imageName: "Image2", price: 2)
                    ]
                    subject.viewModel.menuItems = expectedItemList
                    
                    subject.tableView(subject.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
                }
                
                it("transitions the segue") {
                    
                }
                
                it("sets the view model item list") {
                    
                }
            }
        }
    }
}