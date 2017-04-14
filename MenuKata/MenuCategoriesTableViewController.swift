//
//  ViewController.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/13/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import UIKit
import SVProgressHUD

class MenuCategoriesTableViewController: UITableViewController {
    
    var viewModel = MenuCategoriesViewModel()
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        SVProgressHUD.show(withStatus: "Loading Categories")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        cell.textLabel?.text = viewModel.categories[indexPath.row].categoryName
        
        return cell
    }
}
