//
//  FormDataDisplayViewController.swift
//  ios_assignment_store_local_directory
//
//  Created by promact on 07/02/24.
//

import UIKit

class FormDataDisplayViewController: UIViewController {

    // IBOutlet setup for saving the different entries
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    // variables used to save the data from the previous screen to this screen
    var name: String?
    var age: Int?
    var email: String?
    var address: String?
    var occupation: String?
    var phone: String?
    
    // when the screen is loaded, after routing, these values are updated
    override func viewDidLoad() {
        super.viewDidLoad()

        // unwrapping the optional values of the variables, and then assigning them to their IBOutlet counterparts
        if let name = name,
           let age = age,
           let email = email,
           let address = address,
           let occupation = occupation,
           let phone = phone {
            nameLabel.text = "Name: \(name)"
            ageLabel.text = "Age: \(age)"
            emailLabel.text = "Email: \(email)"
            addressLabel.text = "Address: \(address)"
            occupationLabel.text = "Occupation: \(occupation)"
            phoneLabel.text = "Phone Number: \(phone)"
        }
    }
}
