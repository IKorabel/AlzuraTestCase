//
//  AlzuraAPIManager.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 17.08.2022.
//

import Foundation
import Alamofire

typealias AlzuraApiRequestCompletionHandler<T> = Result<T,APIResponseCompletionHandlerError>

class AlzuraAPIManager {
    
     func makeRequest<T: Codable>(whatToGet: AlzuraApiRequest, returningObjectType: T.Type,  completionHandler: @escaping (Result<T, APIResponseCompletionHandlerError>) -> Void) {
        AF.request(whatToGet.url, method: whatToGet.httpMethod, parameters: whatToGet.parameters, headers: whatToGet.httpHeader).responseData {  requestResult in
            if let requestError = requestResult.error {
                completionHandler(.failure(.alamofireError(error: requestError)))
            } else {
                guard let responseData = requestResult.data else {
                    completionHandler(.failure(.errorDescription(errorText: "There is no data")))
                    return
                }
                
                do {
                    let decodedElement = try JSONDecoder().decode(returningObjectType, from: responseData)
                    completionHandler(.success(decodedElement))
                } catch let decodingError {
                    completionHandler(.failure(.swiftError(error: decodingError)))
                }
            }
        }
    }
}


