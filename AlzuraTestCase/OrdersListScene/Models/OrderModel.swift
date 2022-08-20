//
//  OrderModel.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import Foundation

// MARK: - Datum
struct Order: AlzuraAPIResponse {
    let customer: Customer
    let id: Int
    let createdAt: String
    let payment: Payment
    let datumOperator: Customer
    let updatedAt: String
    let currency: Currency
    let state: Int
    let sumOriginalPrice: Double

    enum CodingKeys: String, CodingKey {
        case customer = "customer"
        case id = "id"
        case createdAt = "created_at"
        case payment = "payment"
        case datumOperator = "operator"
        case updatedAt = "updated_at"
        case currency = "currency"
        case state = "state"
        case sumOriginalPrice = "sum_original_price"
    }
}

// MARK: - Currency
struct Currency: Codable {
    let id: Int
    let factor: Int
    let code: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case factor = "factor"
        case code = "code"
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
    let benefit: Double
    let prices: [Price]?
    let address: Address?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case benefit = "benefit"
        case prices = "prices"
        case address = "address"
    }
}

// MARK: - Address
struct Address: Codable {
    let street: String
    let city: String
    let floor: Int
    let country: Int
    let lastName: String
    let company: String
    let postcode: String
    let salutation: Int
    let firstName: String

    enum CodingKeys: String, CodingKey {
        case street = "street"
        case city = "city"
        case floor = "floor"
        case country = "country"
        case lastName = "last_name"
        case company = "company"
        case postcode = "postcode"
        case salutation = "salutation"
        case firstName = "first_name"
    }
}

// MARK: - Price
struct Price: Codable {
    let gross: Double
    let net: Double
    let tax: Tax

    enum CodingKeys: String, CodingKey {
        case gross = "gross"
        case net = "net"
        case tax = "tax"
    }
}

// MARK: - Tax
struct Tax: Codable {
    let type: String
    let value: Double
    let rate: Int

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
        case rate = "rate"
    }
}

// MARK: - Payment
struct Payment: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let count: Int

    enum CodingKeys: String, CodingKey {
        case count = "count"
    }
}
