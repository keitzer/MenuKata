//
//  MenuItemTests.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/14/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MenuKata

class MenuItemTests: QuickSpec {
    override func spec() {
        describe("MenuItem") {
            it("returns true when all are equal") {
                let item1 = MenuItem(itemName: "Name", imageName: "Image", price: 1)
                let item2 = MenuItem(itemName: "Name", imageName: "Image", price: 1)
                
                expect(item1).to(equal(item2))
            }
            
            it("returns false when name is different") {
                let item1 = MenuItem(itemName: "Name1", imageName: "Image", price: 1)
                let item2 = MenuItem(itemName: "Name2", imageName: "Image", price: 1)
                
                expect(item1).notTo(equal(item2))
            }
            
            it("returns false when image is different") {
                let item1 = MenuItem(itemName: "Name", imageName: "Image1", price: 1)
                let item2 = MenuItem(itemName: "Name", imageName: "Image2", price: 1)
                
                expect(item1).notTo(equal(item2))
            }
            
            it("returns false when price is different") {
                let item1 = MenuItem(itemName: "Name", imageName: "Image", price: 1)
                let item2 = MenuItem(itemName: "Name", imageName: "Image", price: 2)
                
                expect(item1).notTo(equal(item2))
            }
            
            it("can be loaded from dictionary") {
                let item = MenuItem(fromDict: [
                    "name" : "Value",
                    "image" : "Image name",
                    "price" :  5
                ])
                
                expect(item).notTo(beNil())
            }
        }
    }
}
