//
//  AppSettings.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 19.08.2022.
//

import UIKit

class AppSettings {
    static let shared = AppSettings()
    
    
    var isUserSignedIn: Bool {
        get {
            let isSignedIn = UserDefaults.standard.bool(forKey: "isUserSignedIn")
            return isSignedIn
        } set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "isUserSignedIn")
        }
    }
    
    var userAccessToken: String {
        get {
            guard let userAccessToken = UserDefaults.standard.string(forKey: "userAccessToken") else { return ""}
            return userAccessToken
        } set {
            UserDefaults.standard.set(newValue, forKey: "userAccessToken")
        }
    }
}
