//
//  Constants.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/18/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import Foundation

struct Constants {
    static let tipLabels = ["Poor","Average","Good"]
    static let tipAmounts = [0.12, 0.15, 0.18]
    
    struct Segues {
        static let TipInfoSegue = "tipInfoSegue"
    }
    
    struct UserDefaults {
        static let TipAmounts = "TipAmounts"
        static let TipDefault = "TipDefault"
    }
    
    static let maxTipPercentage = 25
    static let minTipPercentage = 5
}
