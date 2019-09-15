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
        dateFormatter.dateFormat = "dd MMM"
        return dateFormatter.string(from: date)
    }
}

extension NSLayoutConstraint {
    func activate() {
        isActive = true
    }
}

extension Float {
    func formattedAmount() -> String {
        return "€ \(self)"
    }
}

