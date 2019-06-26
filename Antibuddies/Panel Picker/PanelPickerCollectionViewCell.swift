//
//  PanelPickerCollectionViewCell.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/11/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit

class PanelPickerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLbl: UILabel!
    
    @IBOutlet weak var scoreView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCard(number: String){
        numberLbl?.text = number
        
        if numberLbl.text == "3"{
            //show starx
        }
    }

}
