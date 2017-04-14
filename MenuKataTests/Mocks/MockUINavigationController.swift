//
//  MockUINavigationController.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/14/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import UIKit
@testable import MenuKata

class MockUINavigationController: UINavigationController, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let pushViewController = "pushViewController"
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        record(invocation: InvocationKeys.pushViewController, with: viewController, animated)
        super.pushViewController(viewController, animated: animated)
    }
}
