//
//  AlzuraApiRequest.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30.11.22.
//

import Foundation
import Alamofire

enum AlzuraApiRequest {
    case getOrders
    case authRequest(user: User)
    
    var url: String {
        switch self {
        case .getOrders:
            return AlzuraApiUrl.orders.urlString
        case .authRequest:
            return AlzuraApiUrl.auth.urlString
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getOrders:
            return .get
        case .authRequest:
            return .post
        }
    }
    
    var httpHeader: HTTPHeaders? {
        switch self {
        case .getOrders:
            return nil
        case .authRequest:
            return ["Accept": "application/vnd.saitowag.api+json;version=1.0", "X-AUTH-TOKEN": AppSettings.shared.userAccessToken]
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getOrders:
            return nil
        case .authRequest(let user):
            return ["Authorization": "Basic \(user.base64Encoded)", "Accept": "application/vnd.saitowag.api+json;version=1.0"]
        }
    }
}

protocol AlzuraAPIResponse: Codable {
    
}
