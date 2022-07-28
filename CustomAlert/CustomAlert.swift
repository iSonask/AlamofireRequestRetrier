//
//  CustomAlert.swift
//  AlamofireRequest
//
//  Created by Daljeet Singh on 07/05/20.
//  Copyright © 2020 Daljeet Singh. All rights reserved.
//

import Foundation
import UIKit



class CustomAlert: NSObject
{
    static func displayAlertWith(title: String?, message: String?, btnTitle: String?)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let updateAlertAction = UIAlertAction(title: btnTitle, style: .default, handler: { action in
            
        })
        
        alertController.addAction(updateAlertAction)
        
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        topController?.present(alertController, animated: true)
    }
}

