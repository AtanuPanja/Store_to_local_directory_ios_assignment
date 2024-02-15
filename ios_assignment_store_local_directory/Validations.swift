//
//  Validations.swift
//  ios_assignment_store_local_directory
//
//  Created by promact on 10/02/24.
//

import Foundation

func validateEmail(_ email: String) -> Bool {
    
    let regex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
    let result = email.range(of: regex, options: .regularExpression)
    return (result != nil)
}

func validatePassword(_ password: String) -> Bool {
    
    let regex = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$"
    let result = password.range(of: regex, options: .regularExpression)
    return (result != nil)
}

func validateAddress(_ address: String) -> Bool {
    return !address.isEmpty
}

func validateOccupation(_ occupation: String) -> Bool {
    let occupationRegex = #"\D+"#
    let occupationOccurence = occupation.range(of: occupationRegex, options: .regularExpression)
    
    return (occupationOccurence != nil)
}

func validateName(_ name: String) -> Bool {
    let nameRegex = #"[A-Za-z]+\s{0,1}"#
    
    let nameOccurence = name.range(of: nameRegex, options: .regularExpression)
    return (nameOccurence != nil)
}

func validatePhone(_ phone: String) -> Bool {
    if let _ = Int(phone) {
        if phone.count < 10 {
            return false
        }
        else {
            return true
        }
    }
    return false
}

func validateAge(_ age: String) -> Bool {
    if let age = Int(age) {
        if age > 0 && age < 101 {
            return true
        }
        else {
            return false
        }
    } else {
            return false
    }
}
