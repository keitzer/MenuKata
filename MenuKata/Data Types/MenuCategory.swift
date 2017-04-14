//
//  MenuCategory.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation

struct MenuCategory: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ==(lhs: MenuCategory, rhs: MenuCategory) -> Bool {
        return lhs.categoryName == rhs.categoryName && lhs.menuItems == rhs.menuItems
    }

    var categoryName: String
    var menuItems: [MenuItem]
    
    init(categoryName: String, menuItems: [MenuItem]) {
        self.categoryName = categoryName
        self.menuItems = menuItems
    }
    
    init?(fromDict dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String, let list = dictionary["items"] as? [[String: Any]] else {
            return nil
        }
        
        self.categoryName = name
        self.menuItems = MenuItem.getItems(fromArray: list)
    }
    
    static func getCategories(fromArray list: [[String: Any]]) -> [MenuCategory] {
        var newList = [MenuCategory]()
        
        for item in list {
            if let newItem = MenuCategory(fromDict: item) {
                newList.append(newItem)
            }
        }
        
        return newList
    }
}
