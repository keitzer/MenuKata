//
//  MockProgressIndicator.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
@testable import MenuKata

class MockProgressIndicator: ProgressIndicator, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let showWithStatus = "showWithStatus"
        static let dismiss = "dismiss"
    }
    
    func show(with status: String) {
        record(invocation: InvocationKeys.showWithStatus, with: status)
    }
    
    func dismiss() {
        record(invocation: InvocationKeys.dismiss)
    }
}
