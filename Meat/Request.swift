//
//  Request.swift
//  Playground
//
//  Created by Umayr Shahid on 05/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import Foundation
import Alamofire

public class Request{
    private static let BASE_URL = "http://localhost:3000/api/v1"
    
    public class func get(endpoint: String, parameters: [String:AnyObject]?, handler: (response : AnyObject?, error: NSError?) -> Void) {
        Alamofire
        .request(.GET, BASE_URL + endpoint, parameters: parameters)
        .responseJSON{
            (_, _, JSON, error) in
            if error == nil {
                handler(response: JSON, error: nil)
            }
            else{
                handler(response: nil, error: error)
            }
        }
    }
    
    public static func getRestaurants(handler: (restaurants: [Restaurant], error: NSError?)->Void){
        let endpoint = "/restaurant?count=40&sort=-rating";

        self.get(endpoint, parameters: nil, handler: {
        (JSON, error) in
            var response: [Restaurant] = Parser.parseRestaurants(JSON)
            handler(restaurants: response, error: error)
        });
    }
    
    public static func getMenus(id: String, handler: (menus : [Menu], error: NSError?) -> Void){
        if !id.isEmpty {
            let endpoint = "/menu?restaurantId=\(id)"
            self.get(endpoint, parameters: nil, handler: {
                (JSON, error) in
                var response: [Menu] = Parser.parseMenus(JSON)
                handler(menus: response, error: error)
            });
        }
    }
}