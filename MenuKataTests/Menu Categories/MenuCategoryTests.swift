//
//  MenuCategoryTests.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/14/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MenuKata

class MenuCategoryTests: QuickSpec {
    override func spec() {
        describe("MenuCategory") {
            it("returns true when name and list are similar") {
                let list1 = [
                    MenuItem(itemName: "Name", imageName: "Image", price: 1)
                ]
                let list2 = [
                    MenuItem(itemName: "Name", imageName: "Image", price: 1)
                ]
                
                let item1 = MenuCategory(categoryName: "Name", menuItems: list1)
                let item2 = MenuCategory(categoryName: "Name", menuItems: list2)
                
                expect(item1).to(equal(item2))
            }
            
            it("returns false when name is different") {
                let list1 = [
                    MenuItem(itemName: "Name", imageName: "Image", price: 1)
                ]
                let list2 = [
                    MenuItem(itemName: "Name", imageName: "Image", price: 1)
                ]
                
                let item1 = MenuCategory(categoryName: "Name1", menuItems: list1)
                let item2 = MenuCategory(categoryName: "Name2", menuItems: list2)
                
                expect(item1).notTo(equal(item2))
            }
            
            it("returns false when lists are different") {
                let list1 = [
                    MenuItem(itemName: "Name", imageName: "Image", price: 1),
                    MenuItem(itemName: "Name", imageName: "Image", price: 1)
                ]
                let list2 = [
                    MenuItem(itemName: "Name", imageName: "Image", price: 1)
                ]
                
                let item1 = MenuCategory(categoryName: "Name", menuItems: list1)
                let item2 = MenuCategory(categoryName: "Name", menuItems: list2)
                
                expect(item1).notTo(equal(item2))
            }
        }
    }
}
