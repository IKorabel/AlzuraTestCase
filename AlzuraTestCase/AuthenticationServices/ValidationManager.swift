//
//  ValidationManager.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 19.08.2022.
//

import UIKit

class ValidationManager {
    
    static func isPasswordValid(password: String) -> Bool {
        guard !password.isEmpty else { return false }
        guard password.count >= 8 else { return false }
        return true
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
