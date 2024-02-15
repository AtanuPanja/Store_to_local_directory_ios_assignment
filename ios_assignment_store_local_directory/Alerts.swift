//
//  Alerts.swift
//  ios_assignment_store_local_directory
//
//  Created by promact on 09/02/24.
//

import UIKit

func showGeneralErrorAlert(onView viewController: UIViewController, containing string: String) {
    let alert = UIAlertController(title: "Error", message: string, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(action)
    
    viewController.present(alert, animated: true, completion: nil)
}
