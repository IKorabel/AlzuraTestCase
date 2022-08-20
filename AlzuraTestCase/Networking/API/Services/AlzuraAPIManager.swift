//
//  AlzuraAPIManager.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 17.08.2022.
//

import Foundation

class AlzuraAPIManager {
    var completionHandler: ((Date) -> Void)?
    
    
    func fetchOrders() {
        guard let apiUrl = URL(string: "https://api-b2b.alzura.com/operator/orders") else { return }
        
        let apiHeader = ["Accept": "application/vnd.saitowag.api+json;version=1.0",
                         "X-AUTH-TOKEN": AppSettings.shared.userAccessToken]
        
        var request = URLRequest(url: apiUrl)
        request.allHTTPHeaderFields = apiHeader
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                   print("Error with the response, unexpected status code: \(response)")
                   return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            print("FetchedOrders: \(data)")
            do {
                let fetchedOrders = try JSONDecoder().decode(OrdersResponse.self, from: data)
                print("FetchedOrders: \(fetchedOrders)")
            } catch let decodingError {
                print("OrdersDecodingError: \(decodingError)")
            }
            
            print("success. Data: \(data)")
        }
        task.resume()
    }
    
    func makeAuthRequest(user: User) {
        guard let authRequestUrl = URL(string: "https://api-b2b.alzura.com/operator/login") else { return }
       // let apiHeader = ["Accept": "application/vnd.saitowag.api+json;version=1.0"]
        var authRequest = URLRequest(url: authRequestUrl)
        authRequest.setValue("Basic \(user.base64Encoded)", forHTTPHeaderField: "Authorization")
        authRequest.setValue("application/vnd.saitowag.api+json;version=1.0", forHTTPHeaderField: "Accept")
        authRequest.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: authRequest) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                   print("Error with the response, unexpected status code: \(response)")
                   return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            do {
                guard let decodedSerializationData = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let authData = decodedSerializationData["data"] as? [String: Any],
                      let token = authData["token"] as? String
                      else { return }
                AppSettings.shared.userAccessToken = token
            } catch let decodingError {
                print(decodingError)
            }
        }
        task.resume()
    }
}
