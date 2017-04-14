//
//  MockMenuCategoriesViewModel.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
@testable import MenuKata

class MockMenuCategoriesViewModel: MenuCategoriesViewModel, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let loadCategories = "loadCategories"
    }
    
    override func loadCategories(withSuccess successBlock: @escaping () -> Void, withFail failBlock: @escaping (String) -> Void) {
        record(invocation: InvocationKeys.loadCategories, with: successBlock, failBlock)
    }
}
