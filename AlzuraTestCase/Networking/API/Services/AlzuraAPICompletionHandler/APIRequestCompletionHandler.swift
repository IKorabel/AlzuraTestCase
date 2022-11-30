//
//  APIRequestCompletionHandler.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30.11.22.
//

import Foundation

enum APIRequestCompletionHandler {
    case success(data: Data)
    case failure(error: APIResponseCompletionHandlerError)
}
