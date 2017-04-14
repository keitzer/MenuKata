//
//  MenuCategoriesViewModelTests.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MenuKata

class MenuCategoriesViewModelTests: QuickSpec {
    override func spec() {
        describe("MenuCategoriesViewModel") {
            var subject: MenuCategoriesViewModel!
            
            beforeEach {
                subject = MenuCategoriesViewModel()
            }
            
            it("uses the global api client") {
                expect(subject.apiClient).to(beIdenticalTo(GlobalAPIClient.shared))
            }
            
            describe("load categories") {
                var mockClient: MockAPIClient!
                var successCalled: Bool!
                beforeEach {
                    mockClient = MockAPIClient()
                    subject.apiClient = mockClient
                    successCalled = false
                    
                    subject.loadCategories(withSuccess: {
                        successCalled = true
                    }, withFail: {_ in })
                }
                
                it("calls into the api client") {
                    expect(mockClient).to(invoke(MockAPIClient.InvocationKeys.loadCategories))
                }
                
                describe("api client success") {
                    it("calls back to the view controller with the success") {
                        let successBlock: (([MenuCategory]) -> Void)? = mockClient.parameter(for: MockAPIClient.InvocationKeys.loadCategories, atParameterIndex: 0)
                        
                        successBlock?([])
                        
                        expect(successCalled).to(beTrue())
                    }
                    
                    it("stores the list on the view model") {
                        let successBlock: (([MenuCategory]) -> Void)? = mockClient.parameter(for: MockAPIClient.InvocationKeys.loadCategories, atParameterIndex: 0)
                        
                        let expectedList = [
                            MenuCategory(categoryName: "Name 1", menuItems: [MenuItem(itemName: "Item", imageName: "", price: 1)]),
                            MenuCategory(categoryName: "Name 2", menuItems: [MenuItem(itemName: "Item2", imageName: "", price: 1)])
                        ]
                        
                        successBlock?(expectedList)
                        
                        expect(subject.categories).to(equal(expectedList))
                    }
                }
            }
        }
    }
}
