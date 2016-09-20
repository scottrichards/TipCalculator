//
//  TipAmountsModel.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/19/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import UIKit
import Foundation

class TipAmountsModel: NSObject {
    static let labels = ["Poor","Average","Good"]
    var amounts : [Float] = [0.12, 0.15, 0.18]
    var defaultAmount : Int = 1
}
