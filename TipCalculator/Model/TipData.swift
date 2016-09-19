//
//  TipData.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/19/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import UIKit
import Foundation

class TipData: NSObject {
    var tipAmounts : TipAmountsModel {
        get {
            return TipData.readData()
        }
    }
    
    static func readData() -> TipAmountsModel {
        let model = TipAmountsModel()
        let defaults = UserDefaults()
        if let tipAmounts = defaults.array(forKey: Constants.UserDefaults.TipAmounts) {
            model.amounts = tipAmounts as! [Float]
        }
        if let _ = defaults.object(forKey: Constants.UserDefaults.TipDefault) {
            model.defaultAmount = defaults.integer(forKey: Constants.UserDefaults.TipDefault)
        }
        return model
    }
    
    static func writeData(tipModel : TipAmountsModel) {
        let defaults = UserDefaults()
        defaults.set(tipModel.amounts, forKey: Constants.UserDefaults.TipAmounts)
        defaults.set(tipModel.defaultAmount, forKey: Constants.UserDefaults.TipDefault)
    }
}
