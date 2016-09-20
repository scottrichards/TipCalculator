//
//  TipAmountController.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/19/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import UIKit

class TipAmountController: UITableViewController {
    var tipAmount : TipAmountsModel?
    var selectedIndex : Int = 0     // which item in the amounts array was selected
    @IBOutlet weak var defaultSwitch: UISwitch!
    @IBOutlet weak var amountLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (self.selectedIndex == tipAmount?.defaultAmount) {
            defaultSwitch.isOn = true
        } else {
            defaultSwitch.isOn = false
        }
        amountLabel.text = String(format: "%d%%",Int( 100 * (tipAmount?.amounts[selectedIndex])!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDefaultChanged(_ sender: AnyObject) {
        if defaultSwitch.isOn {
            tipAmount?.defaultAmount = selectedIndex
        } else {    // truning off default
            if (selectedIndex == 1) {   // default to first item
                tipAmount?.defaultAmount = 0
            } else {
                tipAmount?.defaultAmount = 1    // default to average item
            }
        }
        if let tipAmount = tipAmount {
            TipData.writeData(tipModel: tipAmount)
        }
    }

}
