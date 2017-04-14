//
//  ProductViewController.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/14/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ProductViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    
    var item: MenuItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://raw.githubusercontent.com/keitzer/MenuKataData/master/\(item?.imageName ?? "")")
        imageView.kf.setImage(with: url)
        itemNameLabel.text = item?.itemName
        itemPriceLabel.text = "$\(item?.price ?? 0)"
    }
}
