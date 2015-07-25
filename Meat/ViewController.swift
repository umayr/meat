//
//  ViewController.swift
//  Playground
//
//  Created by Umayr Shahid on 05/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import UIKit
import Alamofire;

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    // Cell Identifier
    let cellIdentifier = "TableCell"
    
    // Empty `Restaurant` Array
    var list:[Restaurant] = []
    
    weak var selectedRetaurant: Restaurant!
    var menuList:[Menu] = []
    
    // `viewDidLoad` function override.
    // Set `tableView` height. Registers its class.
    // Initiates a request to fetch restaurants from API.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Utils.UIColorFromRGB(0xC1272D)
        self.view.tintColor = Utils.UIColorFromRGB(0xFFFFFF)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
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
            let match = restaurant.getName().lowercaseString.rangeOfString(searchText.lowercaseString);
            return match != nil
        });
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "menu_details_segue") {
            var menuController = segue.destinationViewController as! MenuViewController;
            menuController.restaurant = self.selectedRetaurant
            menuController.list = self.menuList
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Hungrilla"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell
        let item: Restaurant = self.list[indexPath.row] as Restaurant
        cell.textLabel?.text = item.getName()
        cell.detailTextLabel?.text = item.getType()
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let id = self.list[indexPath.row].getId();
        
        selectedRetaurant = self.list[indexPath.row]

        Request.getMenus(id, handler: {
            (menus, error) in
            if error == nil{
                if menus.count > 0 {
                    self.menuList = menus
                    self.performSegueWithIdentifier("menu_details_segue", sender: self)
                }
                else {
                    self.presentViewController(Alerts.somethingBroke(), animated: true, completion: nil)
                }
            }
        })
    }

}

