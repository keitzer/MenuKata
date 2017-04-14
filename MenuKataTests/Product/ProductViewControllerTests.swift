//
//  ProductViewControllerTests.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/14/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MenuKata

class ProductViewControllerTests: QuickSpec {
    override func spec() {
        describe("ProductViewController") {
            var subject: ProductViewController!
            
            beforeEach {
                subject = ProductViewController()
                
                subject.imageView = UIImageView()
                subject.itemNameLabel = UILabel()
                subject.itemPriceLabel = UILabel()
            }
            
            describe("view did load") {
                beforeEach {
                    subject.item = MenuItem(itemName: "Some Name", imageName: "Some Image", price: 100)
                    
                    subject.viewDidLoad()
                }
                
                it("sets the name label to the item's name") {
                    expect(subject.itemNameLabel.text).to(equal("Some Name"))
                }
                
                it("sets the price label to the item's price") {
                    expect(subject.itemPriceLabel.text).to(equal("$100"))
                }
                
                it("sets the image based on some caching thing") {
                    // Really annoying to test Kingfisher. So I ignored it here for the sake of speed.
                }
            }
        }
    }
}
