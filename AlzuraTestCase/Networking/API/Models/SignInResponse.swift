//
//  SignInResponse.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import Foundation

//struct SignInResponseData: Codable {
//    let signInResponse: SignInResponse
//}
struct SignInResponse: Decodable {
    let token: String
}
