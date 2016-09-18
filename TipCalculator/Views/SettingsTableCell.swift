//
//  SettingsTableCell.swift
//  TipCalculator
//
//  Created by Scott Richards on 9/18/16.
//  Copyright © 2016 Scott Richards. All rights reserved.
//

import UIKit

class SettingsTableCell: UITableViewCell {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
