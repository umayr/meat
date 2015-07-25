//
//  Restaurant.swift
//  Playground
//
//  Created by Umayr Shahid on 05/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import Foundation

public class Restaurant {
    private var uuid: String
    private var name: String
    private var url: String
    private var rating: Int
    private var type: String

    init(raw: AnyObject) {
        self.uuid = raw["uuid"] as! String
        self.name = raw["name"] as! String
        self.url = raw["url"] as! String
        self.rating = raw["rating"] as! Int
        self.type = raw["type"] as! String
    }

    func getName() -> String {
        return self.name
    }
    
    func getType() -> String{
        return self.type
    }
}
