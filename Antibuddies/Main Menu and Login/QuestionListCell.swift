//
//  QuestionListCell.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/30/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit

class QuestionListCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
}
