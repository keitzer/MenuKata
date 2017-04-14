//
//  MockAPIClient.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
@testable import MenuKata

class MockAPIClient: APIClient, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let loadCategories = "loadCategories"
    }
    
    func loadCategories(withSuccess successBlock: @escaping ([MenuCategory]) -> Void, withFail failBlock: @escaping (String) -> Void) {
        record(invocation: InvocationKeys.loadCategories, with: successBlock, failBlock)
    }
}
