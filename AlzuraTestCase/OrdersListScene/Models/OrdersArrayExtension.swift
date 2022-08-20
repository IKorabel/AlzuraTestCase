//
//  OrdersArrayExtension.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import Foundation

extension Array where Element == Order {
    
    // Filter orders array for a given time range
    func filterOrdersForGivenTimeRange(fromDate: Date, tillDate: Date) -> [Order] {
        let filteredArray = filter({$0.updatedAt.convertToDate() >= fromDate})
        let finishFilteredArray = filteredArray.filter({$0.updatedAt.convertToDate() <= tillDate})
        return finishFilteredArray
    }
    
    // Sort by dates in descending / not descending order
    
    func sortOrders(comparisonResult: ComparisonResult) -> [Order] {
        OrdersListSettings.shared.sortingOrder = comparisonResult
        return sorted(by: {$0.updatedAt.convertToDate().compare($1.updatedAt.convertToDate()) == comparisonResult})
    }
    
    // Under Construction
    func makeSubgroupsOrdersForEveryDate() {
        let groupedDates = Dictionary(grouping: map({$0.updatedAt.convertToDate()})
            .map { ($0,Calendar.current.dateComponents([.year, .month, .day], from: $0))}, by: {$0.1})
            .mapValues {value in value.map {$0.0}}
            .values
    }
}

