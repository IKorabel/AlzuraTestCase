//
//  AlzuraApiUrl.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30.11.22.
//

import Foundation

enum AlzuraApiUrl {
    case orders
    case auth
    
    var urlString: String {
        switch self {
        case .orders:
           return "https://api-b2b.alzura.com/operator/orders"
        case .auth:
           return "https://api-b2b.alzura.com/operator/login"
        }
    }
}
