//
//  MenuItemsTableViewController.swift
//  MenuKata
//
//  Created by Alex Ogorek on 4/14/17.
//  Copyright © 2017 Kata. All rights reserved.
//

import Foundation
import UIKit

class MenuItemsTableViewController: UITableViewController {
    var viewModel = MenuItemsViewModel()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        cell.textLabel?.text = viewModel.menuItems[indexPath.row].itemName
        
        return cell
    }
}
