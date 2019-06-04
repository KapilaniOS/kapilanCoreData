//
//  DisplayTableViewCell.swift
//  kapilanCoreData
//
//  Created by Greeens5 on 21/05/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {

    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var mobileLabel: UILabel!
    @IBOutlet var unameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
