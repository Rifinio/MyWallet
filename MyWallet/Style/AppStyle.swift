//
//  AppStyle.swift
//  MyWallet
//
//  Created by Adil Bougamza on 14/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

struct AppStyle {
    struct Color {
        static let white: UIColor = .white
        static let black: UIColor = .black
        static let gray = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        static let darkGray = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        static let flatRed = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1)
        static let flatGreen = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
    }
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

