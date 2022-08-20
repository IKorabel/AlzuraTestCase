//
//  OrdersListSettings.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import Foundation

class OrdersListSettings {
    static let shared = OrdersListSettings()
    
    var sortingOrder: ComparisonResult = .orderedAscending
}

extension ComparisonResult {
    
    var text: String {
        switch self {
        case .orderedAscending:
            return "Ordered Ascending"
        case .orderedDescending:
            return "Ordered Descending"
        default:
            return ""
        }
    }
}
