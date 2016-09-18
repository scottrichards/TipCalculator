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
    let tipPercentages = [ 0.12, 0.15, 0.18]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func updateTip() {
        let billAmount = Double(billTextField.text!) ?? 0
        let tipAmount = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
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

