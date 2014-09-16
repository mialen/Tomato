//
//  DvdCell.swift
//  tomato
//
//  Created by Alena Nikitina on 9/14/14.
//  Copyright (c) 2014 Alena Nikitina. All rights reserved.
//

import UIKit

class DvdCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
