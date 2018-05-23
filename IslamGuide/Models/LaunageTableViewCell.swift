//
//  LaunageTableViewCell.swift
//  IslamGuide
//
//  Created by hesham tatawy on 18/08/1439 AH.
//  Copyright © 1439 alatheertech. All rights reserved.
//

import UIKit

class LaunageTableViewCell: UITableViewCell {

  
    @IBOutlet var FlagImage: UIImageView!
    
    
    @IBOutlet var LaunageLable: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
