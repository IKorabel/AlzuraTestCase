//
//  User.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 19.08.2022.
//

import Foundation
import Locksmith

struct User: Codable {
    var email: String
    var password: String
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
        return json
    }
    
    var base64Encoded: String {
        let loginString = "\(email):\(password)"
        let loginData = Data(loginString.utf8)
        let base64LoginString = loginData.base64EncodedString()
        print("base64LoginString: \(base64LoginString)")
        return base64LoginString
    }
}
