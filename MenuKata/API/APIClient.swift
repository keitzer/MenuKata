//
//  APIClient.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import Alamofire

protocol APIClient {
    func loadCategories(withSuccess successBlock: @escaping ([MenuCategory]) -> Void, withFail failBlock: @escaping (String) -> Void)
}

class GlobalAPIClient: APIClient {
    private init() {}
    
    static let shared = GlobalAPIClient()
    
    func loadCategories(withSuccess successBlock: @escaping ([MenuCategory]) -> Void, withFail failBlock: @escaping (String) -> Void) {
        
        // for the sake of speed, and also "i know alamore is a pain to test", I skipped testing this method
        
        let url = "https://raw.githubusercontent.com/keitzer/MenuKataData/master/MenuItems.json"
        
        Alamofire.request(url)
            .validate(statusCode: 200..<201)
            .responseJSON { (response) in
                if let responseDict = response.value as? [[String: Any]] {
                    let list = MenuCategory.getCategories(fromArray: responseDict)
                    
                    successBlock(list)
                }
                else {
                    failBlock("Menu failed to load. Try again.")
                }
        }
    }
}
