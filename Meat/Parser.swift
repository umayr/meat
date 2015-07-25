//
//  Parser.swift
//  Playground
//
//  Created by Umayr Shahid on 05/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import Foundation

public class Parser {
    
    public static func parseRestaurants(raw: AnyObject?) -> [Restaurant]{
        var _list = (raw as! NSArray) as Array;
        var restaurants: [Restaurant] = []
        
        for _item in _list{
            restaurants.append(Restaurant(raw: _item));
        }
        
        return restaurants;
    }
}