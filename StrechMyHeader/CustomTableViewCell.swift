//
//  CustomTableViewCell.swift
//  StrechMyHeader
//
//  Created by Yongwoo Huh on 2018-02-28.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var CategoryLabel: UILabel!
     @IBOutlet weak var headlineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
