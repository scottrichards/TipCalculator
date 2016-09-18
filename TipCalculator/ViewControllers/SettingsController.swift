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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            cell.tipAmount.text = String(format:"%.2f", Constants.tipAmounts[indexPath.row])
        }

        return cell
    }
 
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
