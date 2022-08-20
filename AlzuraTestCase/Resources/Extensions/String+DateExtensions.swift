//
//  String+DateExtensions.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import Foundation

extension String {
    
    func convertToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yy hh:mm:ss"
        guard let convertedDate = dateFormatter.date(from: self) else { return Date() }
        return convertedDate
    }
}


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
/* prints:
 {
    "foo" : "bar"
 }
*/
