//
//  AppStyle.swift
//  MyWallet
//
//  Created by Adil Bougamza on 14/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

struct AppStyle {
    struct Font {
        static let lightFontName = "GillSans-Light"
        static let regurlarFontName = "GillSans"
        static let boldFontName = "GillSans-SemiBold"

        static let light = UIFont(name: lightFontName, size: 20)
        static let regular = UIFont(name: regurlarFontName, size: 20)
        static let bold = UIFont(name: boldFontName, size: 20)
        
        static func light(_ size: CGFloat) -> UIFont? {
            return UIFont(name: lightFontName, size: size)
        }
        static func bold(_ size: CGFloat) -> UIFont? {
            return UIFont(name: boldFontName, size: size)
        }
        static func regular(_ size: CGFloat) -> UIFont? {
            return UIFont(name: regurlarFontName, size: size)
        }
    }
    
    struct Card {
        static let backgroundImage = UIImage(named: "card-bg")
        static let providerMaestroImage = UIImage(named: "maestro")
    }
}

