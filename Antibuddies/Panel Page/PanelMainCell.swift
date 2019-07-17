//
//  PanelMainCell.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/18/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit

protocol buttonTapped {
    func buttonTapped(cell: PanelMainCell, buttonColumn: String)
}

class PanelMainCell: UITableViewCell {

    @IBOutlet var cellContentView: UIView!
    @IBOutlet weak var greyNumberLbl: UILabel!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var bigC: UIButton!
    @IBOutlet weak var littleC: UIButton!
    @IBOutlet weak var bigE: UIButton!
    @IBOutlet weak var littleE: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var V: UIButton!
    @IBOutlet weak var Cw: UIButton!
    @IBOutlet weak var BigK: UIButton!
    @IBOutlet weak var littleK: UIButton!
    @IBOutlet weak var Kpa: UIButton!
    @IBOutlet weak var Kpb: UIButton!
    @IBOutlet weak var Jsa: UIButton!
    @IBOutlet weak var JSb: UIButton!
    @IBOutlet weak var Fya: UIButton!
    @IBOutlet weak var Fyb: UIButton!
    @IBOutlet weak var Jka: UIButton!
    @IBOutlet weak var Jkb: UIButton!
    @IBOutlet weak var Lea: UIButton!
    @IBOutlet weak var Leb: UIButton!
    @IBOutlet weak var P1: UIButton!
    @IBOutlet weak var M: UIButton!
    @IBOutlet weak var N: UIButton!
    @IBOutlet weak var S: UIButton!
    @IBOutlet weak var littleS: UIButton!
    @IBOutlet weak var Lua: UIButton!
    @IBOutlet weak var Lub: UIButton!
    @IBOutlet weak var Xga: UIButton!
    @IBOutlet weak var IS: UIButton!
    @IBOutlet weak var thirtySeven: UIButton!
    @IBOutlet weak var AHG: UIButton!
    @IBOutlet weak var CC: UIButton!
    var panelData = [UIButton]()
    var delegate: buttonTapped!
    var cellIndexPath = 0
    var cellRow = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        panelData = [D, bigC, littleC, bigE, littleE, f, V, Cw, BigK, littleK, Kpa, Kpb,Jsa,JSb,Fya,Fyb,Jka, Jkb,Lea,Leb,P1,M,N,S,littleS,Lua,Lub,Xga,IS,thirtySeven,AHG,CC]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //get data from server and load.
        // Configure the view for the selected state
        
    }
    func setCells(){
        
    }
    
    @IBAction func didSelectD(_ sender: Any) {
       // D.titleLabel?.text = "/"
        self.delegate.buttonTapped(cell: self, buttonColumn: "D")
        
    }
    
    @IBAction func didSelectBigC(_ sender: Any) {
        //D.titleLabel?.text = "/"
        self.delegate.buttonTapped(cell: self, buttonColumn: "BigC")
    }
    
    @IBAction func didSelectLittleC(_ sender: Any) {
       // D.titleLabel?.text = "/"
        self.delegate.buttonTapped(cell: self, buttonColumn: "LittleC")
    }
    
    @IBAction func didSelectBigE(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "BigE")
    }
    @IBAction func didSelectLittleE(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "LittleE")
    }
    
    @IBAction func didSelectF(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "F")
    }
    @IBAction func didSelectV(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "V")
    }
    
    @IBAction func didSelectCW(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "Cw")
    }
    
    @IBAction func didSelectBigK(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "BigK")
    }
    
    @IBAction func didSelectLittleK(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "LittleK")
    }
    
    @IBAction func didSelectKPA(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "KPA")
    }
    
    @IBAction func didSelectKPB(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "KPB")
    }
    
    @IBAction func didSelectJSA(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "JSA")
    }
    
    @IBAction func didSelectJSB(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "JSB")
    }
    @IBAction func didSelectFYA(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "FYA")
    }
    
    @IBAction func didSelectFYB(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "FYB")
    }
    
    @IBAction func didSelectJKA(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "JKA")
    }
    @IBAction func didSelectJKB(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "JKB")
    }
    
    @IBAction func didSelectLEA(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "LEA")
    }
    @IBAction func didSelectLEB(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "LEB")
    }
    @IBAction func didSelectP1(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "P1")
    }
    
    @IBAction func didSelectM(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "M")
    }
    
    @IBAction func didSelectN(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "N")
    }
    
    @IBAction func didSelectBigS(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "BigS")
    }
    
    @IBAction func didSelectLittleS(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "LittleS")
    }
    
    @IBAction func didSelectLUA(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "LUA")
    }
    
    @IBAction func didSelectLUB(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "LUB")
    }
    @IBAction func didSelectXGA(_ sender: Any) {
        self.delegate.buttonTapped(cell: self, buttonColumn: "XGA")
    }
    
}
