//
//  OrdersResponse.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import Foundation

// MARK: - OrdersResponse
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ordersResponse = try? newJSONDecoder().decode(OrdersResponse.self, from: jsonData)

import Foundation

// MARK: - OrdersResponse
struct OrdersResponse: AlzuraAPIResponse {
    let meta: Meta
    let data: [Order]

    enum CodingKeys: String, CodingKey {
        case meta = "meta"
        case data = "data"
    }
}
