//
//  MockUITableView.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import UIKit
@testable import MenuKata

class MockUITableView: UITableView, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let reloadData = "reloadData"
    }
    
    override func reloadData() {
        record(invocation: InvocationKeys.reloadData)
    }
}
