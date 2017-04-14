//
//  MenuCategoriesViewModel.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation

class MenuCategoriesViewModel {
    var categories = [MenuCategory]()
    var apiClient: APIClient = GlobalAPIClient.shared
    private var successBlock: (()->Void)!
    
    func loadCategories(withSuccess successBlock: @escaping () -> Void, withFail failBlock: @escaping (String) -> Void) {
        self.successBlock = successBlock
        apiClient.loadCategories(withSuccess: categoriesLoaded, withFail: failBlock)
    }
    
    private func categoriesLoaded(withNewList newList: [MenuCategory]) {
        categories = newList
        successBlock()
    }
}
