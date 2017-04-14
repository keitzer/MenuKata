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
}
