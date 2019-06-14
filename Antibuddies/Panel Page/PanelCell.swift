//
//  PanelCell.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/11/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class PanelCell: UITableViewCell {
    
    
    @IBOutlet weak var Cw: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let font:UIFont? = UIFont(name: "Arial", size:27)
        let fontSuper:UIFont? = UIFont(name: "Arial", size:15)
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "Cw", attributes: [.font:font!])
        attString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:8,length:2))
        Cw.attributedText = attString
    }
}
