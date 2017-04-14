//
//  ProductViewController.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/14/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    
    var item: MenuItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
