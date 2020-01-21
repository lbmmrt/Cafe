//
//  CafeDetailTableViewCell.swift
//  Cafe
//
//  Created by Карина Паланчук on 21/01/2020.
//  Copyright © 2020 Karina Palanchuk. All rights reserved.
//

import UIKit

class CafeDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
