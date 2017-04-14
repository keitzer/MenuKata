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
    var progressIndicator: ProgressIndicator = GlobalProgressIndicator.shared
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        progressIndicator.show(with: "Loading Menu")
        viewModel.loadCategories(withSuccess: categoriesLoaded, withFail: categoriesFailed)
    }
    
    private func categoriesLoaded() {
        progressIndicator.dismiss()
        tableView.reloadData()
    }
    
    private func categoriesFailed(withMessage message: String) {
        progressIndicator.dismiss()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        cell.textLabel?.text = viewModel.categories[indexPath.row].categoryName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "MenuItemsTableViewController") as? MenuItemsTableViewController {
        
            viewController.viewModel.menuItems = viewModel.categories[indexPath.row].menuItems
        
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
