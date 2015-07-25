//
//  MenuViewController.swift
//  Meat
//
//  Created by Umayr Shahid on 25/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import UIKit
import Cosmos

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    weak var restaurant: Restaurant!
    var list: [Menu]!
    let cellIdentifier = "MenuTableCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var cosmos: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = self.restaurant.getName()
        self.type.text = self.restaurant.getType()
        self.cosmos.rating = Double(self.restaurant.getRating())
//        
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.registerClass(TableCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
        self.tableView.estimatedRowHeight = 90.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        //self.tableView.registerClass(MenuTableCell.self, forCellReuseIdentifier: self.cellIdentifier)
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as! UITableViewCell
        let item: Menu = self.list[indexPath.row] as Menu
        cell.textLabel?.text = item.getName()
        cell.detailTextLabel?.text = item.getDescription()
//        cell.nameLabel.text = item.getName()
//        cell.descriptionLabel.text = item.getDescription()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You clicked `\(self.list[indexPath.row].getName())`")
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
}