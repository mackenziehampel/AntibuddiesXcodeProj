//
//  QuestionCell.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/23/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit

protocol RadialButtonDelegate {
    func didSelectRadial(cell: QuestionCell, index:IndexPath)
}

class QuestionCell: UITableViewCell {
   
    @IBOutlet weak var letter: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var bubble: UIButton!
    var isCorrectAnswer = false
    var delegate : RadialButtonDelegate!
    var index: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didSelectBubble(_ sender: Any) {
        
        if bubble.backgroundColor == .clear {
            self.delegate.didSelectRadial(cell: self, index: getIndexPath()!)
            
        } else {
            bubble.backgroundColor = .clear
        }
        
    }
    
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        index = superView.indexPath(for: self)
        return index
    }
    
    
}
