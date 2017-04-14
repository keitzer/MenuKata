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
        return lhs.categoryName == rhs.categoryName && lhs.imageName == rhs.imageName
    }

    var categoryName: String
    var imageName: String
}
