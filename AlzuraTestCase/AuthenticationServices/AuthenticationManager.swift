//
//  AuthenticationManager.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 19.08.2022.
//

import UIKit
import Locksmith

// We use this class for user's authentication

class AuthenticationManager {

    let keychainManager = KeychainManager()
    
    func signIn(user: User, completion: @escaping (AuthCompletionHandler) -> Void) {
        guard let foundedUser = keychainManager.getData(userAccountName: user.email) else {
        completion(.failure(errorDescription: "No such user exists. Please check your Email"))
        return
        }
        
        guard let foundedUserPassword = foundedUser["password"] as? String,
              foundedUserPassword == user.password else {
              completion(.failure(errorDescription: "Incorrect password"))
              return
        }
        
        AppSettings.shared.isUserSignedIn = true
        completion(.success(user: nil))
    }
    
    func signUp(user: User, completion: @escaping (AuthCompletionHandler) -> Void) {
        guard let dictionary = user.dictionary else {
            completion(.failure(errorDescription: "Invalid dictionary"))
            return
        }
        keychainManager.saveData(dataToSave: dictionary, userAccountName: user.email) { signUpStatus in
            switch signUpStatus {
            case .success(let user):
                AppSettings.shared.isUserSignedIn = true
                completion(.success(user: user))
            case .failure(let errorDescription):
                completion(.failure(errorDescription: errorDescription))
            }
        }
    }
    
    func signOut(completion: @escaping () -> Void) {
        AppSettings.shared.isUserSignedIn = false
        completion()
    }
    
}

enum AuthCompletionHandler {
    case success(user: User?)
    case failure(errorDescription: String)
}


