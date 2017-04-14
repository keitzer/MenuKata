//
//  ProgressIndicator.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import SVProgressHUD

class ProgressIndicator {
    private init() {}
    
    static let shared = ProgressIndicator()
    
    func show(with status: String) {
        SVProgressHUD.show(withStatus: status)
    }
    
    func dismiss() {
        SVProgressHUD.dismiss()
    }
}
