//
//  HelperExtensions.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

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

