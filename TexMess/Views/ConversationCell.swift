//
//  ConversationCell.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 10/6/22.
//

import UIKit

class ConversationCell: UITableViewCell {
    
    @IBOutlet weak var leftAvatar: UIImageView!
    @IBOutlet weak var conversationBubble: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        conversationBubble.layer.cornerRadius = conversationBubble.frame.size.height / 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
