//
//  ViewController.swift
//  Playground
//
//  Created by Umayr Shahid on 05/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import UIKit
import Alamofire;

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    @IBOutlet weak var textbox: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Cell Identifier
    let cellIdentifier = "TableCell"
    
    // Keeping track if a search is active.
    var searchActive: Bool = false
    
    // Empty `Restaurant` Array
    var list:[Restaurant] = []
    
    // Empty filtered `Restaurant` Array
    var filtered:[Restaurant] = []
    
    // `viewDidLoad` function override.
    // Set `tableView` height. Registers its class.
    // Initiates a request to fetch restaurants from API.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.registerClass(TableCell.self, forCellReuseIdentifier: cellIdentifier)
        self.getTopRestaurants()
    }
    
    // Gets top restaurant from API.
    func getTopRestaurants(){
        Request.getRestaurants({
            (restaurants, error) in
            if error == nil{
                self.list = restaurants
                self.tableView.reloadData()
            }
        })
    }

    func filterRestaurants(searchText: String) -> [Restaurant]{
        return self.list.filter({
            (restaurant: Restaurant) -> Bool in
            let match = restaurant.getName().rangeOfString(searchText);
            return match != nil
        });
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchActive {
            return self.filtered.count
        }
        return self.list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell
        let item: Restaurant;
        
        if self.searchActive {
            item = self.filtered[indexPath.row] as Restaurant
        }
        else {
            item = self.list[indexPath.row] as Restaurant
        }
        
        cell.textLabel?.text = item.getName()
        cell.detailTextLabel?.text = item.getType()
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = self.filterRestaurants(searchText)
        
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }

}

