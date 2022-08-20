//
//  User.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 19.08.2022.
//

import Foundation
import Locksmith

struct User: Codable {
    var username: String
    var password: String
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
        return json
    }
}
