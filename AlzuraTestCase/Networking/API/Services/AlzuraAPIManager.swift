//
//  AlzuraAPIManager.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 17.08.2022.
//

import Foundation
import Alamofire

class AlzuraAPIManager {
    
    func fetchOrders(completion: @escaping (APIRequestCompletionHandler) -> Void) {
        makeApiRequest(request: .getOrders) { getOrdersResponse in
            print("\(AppSettings.shared.userAccessToken)")
            completion(getOrdersResponse)
        }
    }
    
    func makeAuthRequest(user: User?,completionHandler: @escaping (APIRequestCompletionHandler) -> Void) {
        guard let user = user else {
             completionHandler(.failure(error: .signInError))
            return
        }
        makeApiRequest(request: .authRequest(user: user)) { apiResponse in
            completionHandler(apiResponse)
        }
    }
    
    private func makeApiRequest(request: AlzuraApiRequest, completionHandler: @escaping (APIRequestCompletionHandler) -> Void) {
        AF.request(request.url, method: request.httpMethod, parameters: request.parameters, headers: request.httpHeader).responseData {  requestResult in
            if let requestError = requestResult.error {
                completionHandler(.failure(error: .alamofireError(error: requestError)))
            } else {
                guard let responseData = requestResult.data else {
                    completionHandler(.failure(error: .errorDescription(errorText: "There is not data")))
                    return
                }
                completionHandler(.success(data: responseData))
            }
        }
        
    }
}

enum APIResponseCompletionHandler {
    case success(successfulObtainedObject: APIResponseCompletionHandlerSuccess)
    case failure(obtainedWithError: APIResponseCompletionHandlerError)
}

enum APIResponseCompletionHandlerSuccess {
    case obtainedOrders(orders: [Order])
    case otherData(data: Data)
}

protocol AlzuraAPIResponse: Codable {
    
}

