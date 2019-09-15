//
//  HelperExtensions.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

class DateFormatterUtil {
    private static let dateFormatter = DateFormatter()
    
    static func stringToDate(dateStr: String) -> Date? {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: dateStr)
    }
    
    static func formattedDateForTrasaction(date: Date) -> String? {
        dateFormatter.dateFormat = "dd MMM yyyy, HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}

extension NSLayoutConstraint {
    func activate() {
        isActive = true
    }
}

extension Float {
    func formattedAmount(addOperator: Bool = true) -> String {
        var _operator = ""
        if addOperator {
            _operator = self < 0 ? "-" : "+"
        }

        return "€\(_operator)\(abs(self))"
    }
}

