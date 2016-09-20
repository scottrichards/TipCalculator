//
//  TipAmountController.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/19/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import UIKit

class TipAmountController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {


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
        setTo(percentage: Int( 100 * (tipAmount?.amounts[selectedIndex])!))
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
    
    // MARK: PickerView
    
    func setTo(percentage:Int) {
        var percentage = percentage
        percentage = max(percentage,Constants.minTipPercentage)
        percentage = min(percentage,Constants.maxTipPercentage)
        amountLabel.text = String(format: "%d%%",percentage)
        percentPicker.selectRow(percentage - Constants.minTipPercentage, inComponent: 0, animated:false)
    }
    

    // User selected row in PickerView
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let percentage = Constants.minTipPercentage + row
        tipAmount?.amounts[selectedIndex] = Float(Float(percentage) / Float(100))
        TipData.writeData(tipModel: tipAmount!)
        amountLabel.text = String(format: "%d%%",percentage)
    }
    
    // MARK: PickerView Datasource
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.maxTipPercentage - Constants.minTipPercentage + 1
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + Constants.minTipPercentage)
    }
    
}
