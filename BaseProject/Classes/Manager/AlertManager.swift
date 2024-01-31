//
//  AlertManager.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation
import UIKit

public class AlertManager {
    
    public static let shared = AlertManager()
    
    func showAlert(withError error: CustomError) -> UIAlertController {
        var alert: UIAlertController
        
        alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "title.confirm".localizeString(), style: .destructive) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        return alert
    }
    
    func showInfoAlert(withTitle title: String, message: String) -> UIAlertController {
        var alert: UIAlertController
        
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "title.confirm".localizeString(), style: .destructive) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        return alert
    }
}
