//
//  ViewController.swift
//  ios_assignment_store_local_directory
//
//  Created by promact on 07/02/24.
//

import UIKit


class LoginScreenViewController: UIViewController {

    // IBOutlet setup for accessing values of the login and password input fields
    @IBOutlet weak var loginEmailInput: UITextField!
    @IBOutlet weak var loginPasswordInput: UITextField!
    
    // the default viewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // the viewWillAppear is called before every render of the screen. So, even when routing back (using the Back buttons, this function is called and executed)
    // This feature has been utilized to make sure that the text fields are empty before the screen the rendered, such that the user can enter new values
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginEmailInput.text = ""
        loginPasswordInput.text = ""
    }
    
    // IBAction method for defining all actions to be performed when the submit button was tapped
    @IBAction func loginSubmitWasTapped(_ sender: Any) {
        
        // unwrapping the optional email and password textfield texts
        if let email = loginEmailInput.text,
           let password = loginPasswordInput.text {
            
            // checking for empty values
            var emptyValues = ""
            if email.isEmpty || password.isEmpty {
                if email.isEmpty && password.isEmpty {
                    emptyValues = "Email and password"
                } else if email.isEmpty {
                    emptyValues = "Email"
                } else if password.isEmpty {
                    emptyValues = "Password"
                }
                // empty values alert
                showGeneralErrorAlert(onView: self, containing: "Please fill in \(emptyValues)")
            }
            else {
                // checking for not empty, but invalid values
                let emailValid = validateEmail(email)
                let passwordValid = validatePassword(password)
                var invalids = ""
                
                // if email and password are valid, route to the next screen
                if emailValid && passwordValid {
                    let formScreenViewController = self.storyboard?.instantiateViewController(withIdentifier: "FormScreenViewController") as! FormScreenViewController
                    
                    // routing to the next screen
                    navigationController?.pushViewController(formScreenViewController, animated: true)
                }
                else {
                    
                    // else check for which values are invalid
                    if !emailValid && !passwordValid {
                        invalids = "Email and Password"
                    }
                    else if !emailValid {
                        invalids = "Email"
                    }
                    else if !passwordValid {
                        invalids = "Password"
                    }
                    
                    // show appropriate alert for the invalid entries
                    showGeneralErrorAlert(onView: self, containing: "Please enter valid \(invalids)")
                }
            }
        }
    }
    
}

