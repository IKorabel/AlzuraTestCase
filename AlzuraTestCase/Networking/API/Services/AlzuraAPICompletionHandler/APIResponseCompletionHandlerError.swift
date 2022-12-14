//
//  APIResponseCompletionHandlerError.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30.11.22.
//

import Foundation
import Alamofire

enum APIResponseCompletionHandlerError: Error {
    case alamofireError(error: AFError)
    case signInError
    case swiftError(error: Error)
    case errorDescription(errorText: String)
    
    var errorDescription: String {
        switch self {
        case .alamofireError(let error):
            return error.localizedDescription
        case .signInError:
            return "Please sign in"
        case .errorDescription(let errorText):
            return errorText
        case .swiftError(let error):
            return error.localizedDescription
        default:
            return localizedDescription
        }
    }
}
