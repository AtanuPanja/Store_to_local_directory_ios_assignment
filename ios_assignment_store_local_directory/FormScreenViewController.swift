//
//  FormScreenViewController.swift
//  ios_assignment_store_local_directory
//
//  Created by promact on 07/02/24.
//

import UIKit

class FormScreenViewController: UIViewController {

    
    // IBOutlet setup for accessing the values of the name, age, email, address, occupation, phone number text fields
    @IBOutlet weak var formNameInput: UITextField!
    @IBOutlet weak var formAgeInput: UITextField!
    @IBOutlet weak var formEmailInput: UITextField!
    @IBOutlet weak var formAddressInput: UITextField!
    @IBOutlet weak var formOccupationInput: UITextField!
    @IBOutlet weak var formPhoneInput: UITextField!
    
    // default viewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // the viewWillAppear is called before every render of the screen. So, even when routing back (using the Back buttons, this function is called and executed)
    // This feature has been utilized to make sure that the text fields are empty before the screen the rendered, such that the user can enter new values
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formNameInput.text = ""
        formAgeInput.text = ""
        formEmailInput.text = ""
        formAddressInput.text = ""
        formOccupationInput.text = ""
        formPhoneInput.text = ""
    }
    
    // IBAction method for defining all functionality to perform when the form submit is tapped.
    @IBAction func formSubmitWasTapped(_ sender: Any) {
        // unwrapping all optional text field values
        if let name = formNameInput.text,
           let age = formAgeInput.text,
           let email = formEmailInput.text,
           let address = formAddressInput.text,
           let occupation = formOccupationInput.text,
           let phone = formPhoneInput.text {
            
            // checking for empty fields
            var emptyValues = ""
            if name.isEmpty || age.isEmpty || email.isEmpty || address.isEmpty || occupation.isEmpty || phone.isEmpty {
                if name.isEmpty && age.isEmpty && email.isEmpty && address.isEmpty && occupation.isEmpty && phone.isEmpty {
                    emptyValues = "all fields"
                } else if age.isEmpty {
                    emptyValues = "age"
                } else if email.isEmpty {
                    emptyValues = "email"
                } else if address.isEmpty {
                    emptyValues = "eddress"
                } else if occupation.isEmpty {
                    emptyValues = "occupation"
                } else if phone.isEmpty {
                    emptyValues = "phone number"
                }
                
                // alert for empty values
                showGeneralErrorAlert(onView: self, containing: "Please fill in \(emptyValues)")
            }
            else {
                // checking for invalid fields
                var invalids = ""
                let nameIsValid = validateName(name)
                let ageIsValid = validateAge(age)
                let emailIsValid = validateEmail(email)
                let addressIsValid = validateAddress(address)
                let occupationIsValid = validateOccupation(occupation)
                let phoneIsValid = validatePhone(phone)
                
                if !nameIsValid || !ageIsValid || !emailIsValid || !addressIsValid || !occupationIsValid || !phoneIsValid {
                    if !nameIsValid && !ageIsValid && !emailIsValid && !addressIsValid && !occupationIsValid && !phoneIsValid {
                        invalids = "values in all fields"
                        
                    } else if !nameIsValid {
                        invalids = "name"
                    } else if !ageIsValid {
                        invalids = "age"
                    } else if !emailIsValid {
                        invalids = "email"
                    } else if !addressIsValid {
                        invalids = "address"
                    } else if !occupationIsValid {
                        invalids = "occupation"
                    } else if !phoneIsValid {
                        invalids = "phone number"
                    }
                    
                    // alert for invalid values
                    showGeneralErrorAlert(onView: self, containing: "Please enter valid \(invalids)")
                }
                else {
                    
                    // if all fields are valid, route to the next screen, and pass the data to display
                    let formDataDisplayViewController = self.storyboard?.instantiateViewController(withIdentifier: "FormDataDisplayViewController") as! FormDataDisplayViewController
                    
                    // setting the variables from the formData screen
                    formDataDisplayViewController.name = name
                    formDataDisplayViewController.age = Int(age)
                    formDataDisplayViewController.email = email
                    formDataDisplayViewController.address = address
                    formDataDisplayViewController.occupation = occupation
                    formDataDisplayViewController.phone = phone
                    
                    // routing to the next screen
                    navigationController?.pushViewController(formDataDisplayViewController, animated: true)
                }
            }
            
        }
    }
    
}
