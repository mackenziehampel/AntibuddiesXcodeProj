//
//  QuestionCell.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/23/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var letter: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var bubble: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}