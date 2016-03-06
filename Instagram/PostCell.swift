//
//  PostCell.swift
//  Instagram
//
//  Created by Tom H on 3/6/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var postImageView: PFImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var instagramPost: PFObject! {
        didSet {
            self.postLabel.text = instagramPost["caption"] as? String
            self.postImageView.file = instagramPost["media"] as? PFFile
            self.postImageView.loadInBackground()
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        selectionStyle = .None
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
