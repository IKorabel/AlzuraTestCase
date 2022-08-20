//
//  OrdersResponse.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ordersResponse = try? newJSONDecoder().decode(OrdersResponse.self, from: jsonData)

import Foundation

// MARK: - OrdersResponse
struct OrdersResponse: Codable {
    let data: [Order]
    let meta: Meta

    enum CodingKeys: String, CodingKey {
        case data
        case meta
    }
}

// MARK: - Datum
struct Order: Codable {
    let id: Int
    let createdAt: String
    let updatedAt: String
    let state: Int
    let payment: Payment
    let currency: Currency
    let sumOriginalPrice: Int
    let datumOperator: Customer
    let customer: Customer

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case updatedAt
        case state
        case payment
        case currency
        case sumOriginalPrice
        case datumOperator
        case customer
    }
}

// MARK: - Currency
struct Currency: Codable {
    let id: Int
    let code: String
    let factor: Double

    enum CodingKeys: String, CodingKey {
        case id
        case code
        case factor
    }
    
    func getCurrencySymbol() -> String? {
        let locale = NSLocale(localeIdentifier: code)
        if locale.displayName(forKey: .currencySymbol, value: code) == code {
            let newlocale = NSLocale(localeIdentifier: code.dropLast() + "_en")
            return newlocale.displayName(forKey: .currencySymbol, value: code)
        }
        return locale.displayName(forKey: .currencySymbol, value: code)
    }
}

// MARK: - Customer
struct Customer: Codable {
    let id: Int
    let address: Address
    let ipAddress: String
    let prices: [Price]
    let benefit: Double

    enum CodingKeys: String, CodingKey {
        case id
        case address
        case ipAddress
        case prices
        case benefit
    }
}

// MARK: - Address
struct Address: Codable {
    let salutation: Int
    let firstName: String
    let lastName: String
    let company: String
    let street: String
    let postcode: String
    let city: String
    let floor: Int
    let country: Int

    enum CodingKeys: String, CodingKey {
        case salutation
        case firstName
        case lastName
        case company
        case street
        case postcode
        case city
        case floor
        case country
    }
}

// MARK: - Price
struct Price: Codable {
    let gross: Double
    let net: Int
    let tax: Tax

    enum CodingKeys: String, CodingKey {
        case gross
        case net
        case tax
    }
}

// MARK: - Tax
struct Tax: Codable {
    let rate: Int
    let type: String
    let value: Double

    enum CodingKeys: String, CodingKey {
        case rate
        case type
        case value
    }
}

// MARK: - Payment
struct Payment: Codable {
    let id: Int
    let name: String
    let transaction: Transaction

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case transaction
    }
}

// MARK: - Transaction
struct Transaction: Codable {
    let id: String

    enum CodingKeys: String, CodingKey {
        case id
    }
}

// MARK: - Meta
struct Meta: Codable {
    let count: Int
    let limit: Int
    let offset: Int

    enum CodingKeys: String, CodingKey {
        case count
        case limit
        case offset
    }
}
