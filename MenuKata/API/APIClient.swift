//
//  APIClient.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation


protocol APIClient {
    func loadCategories(withSuccess successBlock: ([MenuCategory]) -> Void, withFail failBlock: (String) -> Void)
}

class GlobalAPIClient: APIClient {
    private init() {}
    
    static let shared = GlobalAPIClient()
    
    func loadCategories(withSuccess successBlock: ([MenuCategory]) -> Void, withFail failBlock: (String) -> Void) {
        
    }
}
