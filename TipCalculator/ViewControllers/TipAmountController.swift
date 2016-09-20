//
//  TipAmountController.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/19/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import UIKit

class TipAmountController: UITableViewController, UIPickerViewDataSource {


    var tipAmount : TipAmountsModel?
    var selectedIndex : Int = 0     // which item in the amounts array was selected
    @IBOutlet weak var defaultSwitch: UISwitch!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var percentPicker: UIPickerView!
    

    
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
    
 //   @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.maxTipPercentage - Constants.minTipPercentage + 1
    }
    
//    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
 //   @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + Constants.minTipPercentage)
    }
    
}
