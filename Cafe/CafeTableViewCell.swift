//
//  CafeTableViewCell.swift
//  Cafe
//
//  Created by Карина Паланчук on 16/01/2020.
//  Copyright © 2020 Karina Palanchuk. All rights reserved.
//

import UIKit

class CafeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCafe: UIImageView!
    @IBOutlet weak var nameLebel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
