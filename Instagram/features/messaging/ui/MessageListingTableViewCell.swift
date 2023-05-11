//
//  MessageListingTableViewCell.swift
//  Instagram
//
//  Created by ovais on 11/05/2023.
//

import UIKit

class MessageListingTableViewCell: UITableViewCell {

    @IBOutlet weak var messageBody: UITextView!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
