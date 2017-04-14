//
//  MenuItem.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation

struct MenuItem: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ==(lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.itemName == rhs.itemName
            && lhs.imageName == rhs.imageName
            && lhs.price == rhs.price
        
    }
    
    var itemName: String
    var imageName: String
    var price: Int
    
    init(itemName: String, imageName: String, price: Int) {
        self.itemName = itemName
        self.imageName = imageName
        self.price = price
    }
    
    init?(fromDict dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let image = dictionary["image"] as? String,
            let price = dictionary["price"] as? Int else {
            return nil
        }
        
        self.itemName = name
        self.imageName = image
        self.price = price
    }
    
    static func getItems(fromArray list: [[String: Any]]) -> [MenuItem] {
        var newList = [MenuItem]()
        
        for item in list {
            if let newItem = MenuItem(fromDict: item) {
                newList.append(newItem)
            }
        }
        
        return newList
    }
}
