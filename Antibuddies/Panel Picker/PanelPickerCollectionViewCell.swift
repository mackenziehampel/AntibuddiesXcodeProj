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
    @IBOutlet weak var scoreLbl: UILabel!
    
    var level = String()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCard(number: String){
        numberLbl?.text = number
        
        switch level {
        case "b":
            
            numberLbl.textColor = UIColor.init(red: (67.0/255.0), green: (150.0/255.0), blue: (77.0/255.0), alpha: 1.0)
            scoreLbl.textColor = UIColor.init(red: (67.0/255.0), green: (150.0/255.0), blue: (77.0/255.0), alpha: 1.0)
        case "i":
            numberLbl.textColor = UIColor.init(red: (233.0/255.0), green: (168.0/255.0), blue: (1.0/150.0), alpha: 1.0)
             scoreLbl.textColor = UIColor.init(red: (233.0/255.0), green: (168.0/255.0), blue: (1.0/150.0), alpha: 1.0)
        case "a":
            numberLbl.textColor = UIColor.init(red:(115.0/255.0), green: (38.0/255.0), blue: (176.0/255.0), alpha: 1.0)
            scoreLbl.textColor =  UIColor.init(red:(115.0/255.0), green: (38.0/255.0), blue: (176.0/255.0), alpha: 1.0)
        default:
            break
    }
    }

}
