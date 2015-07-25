//
//  Menu.swift
//  Meat
//
//  Created by Umayr Shahid on 25/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import Foundation

public class Menu{
    private var uuid: String
    private var restaurantId: String
    private var name: String
    private var description: String
    private var type: String
    private var serves: String
    private var price: String
    
    init(raw:AnyObject){
        self.uuid = raw["uuid"] as! String
        self.restaurantId = raw["restaurantId"] as! String
        self.name = raw["name"] as! String
        self.description = raw["description"] as! String
        self.type = raw["type"] as! String
        self.serves = raw["serves"] as! String
        self.price = raw["price"] as! String
    }
    
    func getName() -> String{
        return self.name
    }
    
    func getDescription() -> String{
        return self.description ?? "N/A"
    }
}