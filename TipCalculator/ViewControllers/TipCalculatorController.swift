//
//  ViewController.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/17/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import UIKit

class TipCalculatorController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
//    var numberFormatter : NumberFormatter = NumberFormatter()
    var tipAmounts : TipAmountsModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tipAmounts = TipData.readData()     // reload data by reading from UserDefaults
        tipControl.selectedSegmentIndex = (tipAmounts?.defaultAmount)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func updateTip() {
        let billAmount = Float(billTextField.text!) ?? 0
        var tipPercentage = Float(Constants.tipAmounts[1])
        if let tipAmounts = tipAmounts {
            tipPercentage = tipAmounts.amounts[tipAmounts.defaultAmount]
        }
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount
        self.tipLabel.text = String(format:"$ %.2f",tipAmount)
        self.totalLabel.text = String(format:"$ %.2f",totalAmount)
    }
    
    // MARK : Actions
    
    @IBAction func onMainTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onTipChanged(_ sender: AnyObject) {
        updateTip()
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        updateTip()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsController = segue.destination as! SettingsController
        settingsController.delegate = self
    }
}

