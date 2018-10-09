//
//  ChatCell.swift
//  ParseChat
//
//  Created by MacBookPro9 on 10/7/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
