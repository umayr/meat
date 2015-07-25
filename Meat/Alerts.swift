//
//  Alerts.swift
//  Meat
//
//  Created by Umayr Shahid on 25/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import Foundation
import UIKit

public class Alerts {
    public static func somethingBroke() -> UIAlertController{
        var alert = UIAlertController(
            title: "Ow!",
            message: "It appears something is broken. \nPlease try again later.",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        alert.addAction(
            UIAlertAction(
                title: "Okay",
                style: UIAlertActionStyle.Destructive,
                handler: nil
            )
        )
        return alert
    }
}