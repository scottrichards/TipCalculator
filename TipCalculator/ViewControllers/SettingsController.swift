//
//  SettingsController.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/18/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    var delegate : TipCalculatorController?
    var tipAmounts : TipAmountsModel?
    var lastSelectedRow : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipAmounts = TipData.readData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData() // reload Data when coming back from the Amounts Controller
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (delegate != nil) {
            return Constants.tipLabels.count
        } else {
            return 0
        }
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SettingsTableCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsTableCell

        if (indexPath.row < Constants.tipLabels.count) {
            cell.tipLabel.text = Constants.tipLabels[indexPath.row]
            cell.tipAmount.text = String(format:"%d%%", Int( 100 * (tipAmounts?.amounts[indexPath.row])!) )
        }
        if (indexPath.row == tipAmounts?.defaultAmount) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
 
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        lastSelectedRow = indexPath.row
        return indexPath
    }
  
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.Segues.TipInfoSegue) {
            let segueController = segue.destination as! TipAmountController
            segueController.tipAmount = tipAmounts
            segueController.selectedIndex = lastSelectedRow
        }
     }
 
}
