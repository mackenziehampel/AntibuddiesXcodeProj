//
//  PanelCell.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/11/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit


//Allelic Pairs
class PanelCell: UITableViewCell {
   
    
    @IBOutlet weak var pairCc: UIView!
    @IBOutlet weak var pairEe: UIView!
    @IBOutlet weak var pairJkaJkb: UIView!
    @IBOutlet weak var pairFyaFyb: UIView!
    @IBOutlet weak var pairMN: UIView!
    @IBOutlet weak var PairSs: UIView!
    
    @IBOutlet weak var E: UILabel!
    @IBOutlet weak var Cw: UILabel!
    @IBOutlet weak var Kpa: UILabel!
    @IBOutlet weak var Kpb: UILabel!
    @IBOutlet weak var Jsa: UILabel!
    @IBOutlet weak var Jsb: UILabel!
    @IBOutlet weak var Fya: UILabel!
    @IBOutlet weak var Fyb: UILabel!
    @IBOutlet weak var Jka: UILabel!
    @IBOutlet weak var Jkb: UILabel!
    @IBOutlet weak var Lea: UILabel!
    @IBOutlet weak var Leb: UILabel!
    @IBOutlet weak var Lua: UILabel!
    @IBOutlet weak var Lub: UILabel!
    @IBOutlet weak var Xga: UILabel!
    @IBOutlet weak var P1: UILabel!
    
    
    let x = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.turnOnAllelicPairs(passedView: self.pairCc)
        self.turnOnAllelicPairs(passedView: self.pairEe)
        self.turnOnAllelicPairs(passedView: self.pairFyaFyb)
        self.turnOnAllelicPairs(passedView: self.pairJkaJkb)
        self.turnOnAllelicPairs(passedView: self.pairMN)
        self.turnOnAllelicPairs(passedView: self.PairSs)
        
        self.pairCc.isHidden = true
        self.pairEe.isHidden = true
        self.pairFyaFyb.isHidden = true
        self.pairJkaJkb.isHidden = true
        self.pairMN.isHidden = true
        self.PairSs.isHidden = true
        
        
        let font:UIFont? = UIFont(name: "HelveticaNeue-Bold", size:22)
        let fontSuper:UIFont? = UIFont(name: "HelveticaNeue-Bold", size:15)
        
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "Cw", attributes: [.font:font!])
        attString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:1,length:1))
        self.Cw.attributedText = attString
        
        let kpaAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Kpa", attributes: [.font:font!])
        kpaAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Kpa.attributedText = kpaAttString
        
        let kpbAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Kpb", attributes: [.font:font!])
        kpbAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Kpb.attributedText = kpbAttString
        
        
        let jsaAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Jsa", attributes: [.font:font!])
        jsaAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Jsa.attributedText = jsaAttString
        
        let jsbAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Jsb", attributes: [.font:font!])
        jsbAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Jsb.attributedText = jsbAttString
        
        let fyaAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Fya", attributes: [.font:font!])
        fyaAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Fya.attributedText = fyaAttString
        
        let fybAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Fyb", attributes: [.font:font!])
        fybAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Fyb.attributedText = fybAttString
        
        let jkaAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Jka", attributes: [.font:font!])
        jkaAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Jka.attributedText = jkaAttString
        
        let jkbAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Jkb", attributes: [.font:font!])
        jkbAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Jkb.attributedText = jkbAttString
        
        let leaAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Lea", attributes: [.font:font!])
        leaAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Lea.attributedText = leaAttString
        
        let lebAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Leb", attributes: [.font:font!])
        lebAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Leb.attributedText = lebAttString
        
        let luaAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Lua", attributes: [.font:font!])
        luaAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Lua.attributedText = luaAttString
        
        let lubAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Lub", attributes: [.font:font!])
        lubAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Lub.attributedText = lubAttString
        
        let xgaAttString:NSMutableAttributedString = NSMutableAttributedString(string: "Xga", attributes: [.font:font!])
        xgaAttString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:2,length:1))
        self.Xga.attributedText = xgaAttString
        
        let pAttString:NSMutableAttributedString = NSMutableAttributedString(string: "P1", attributes: [.font:font!])
        pAttString.setAttributes([.font:fontSuper!,.baselineOffset:-4], range: NSRange(location:1,length:1))
        self.P1.attributedText =  pAttString
        
    }
    
    func turnOnAllelicPairs(passedView: UIView) {
        let highlightColor = UIColor.init(red: (223.0/255.0), green: (168.0/255.0), blue: (1.0/255.0), alpha: 1.0)
        
       // self.pairCc.addBorder(toSide: .left, withColor: highlightColor as! CGColor, andThickness: 5.0)
        //self.pairCc.addBorder(toSide: .top, withColor: highlightColor as! CGColor, andThickness: 5.0)
        //self.pairCc.addBorder(toSide: .right, withColor: highlightColor as! CGColor, andThickness: 2.0)
        let topBorder: CALayer = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: passedView.frame.size.width, height: 3.0)
        topBorder.backgroundColor = highlightColor.cgColor
        passedView.layer.addSublayer(topBorder)
        let leftSideBorder: CALayer = CALayer()
        leftSideBorder.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: passedView.frame.size.height)
        leftSideBorder.backgroundColor = highlightColor.cgColor
        passedView.layer.addSublayer(leftSideBorder)
        let rightSideBorder: CALayer = CALayer()
        rightSideBorder.frame = CGRect(x: passedView.frame.size.width - 3.0, y: 0.0, width: 3.0, height: passedView.frame.size.height)
        rightSideBorder.backgroundColor = highlightColor.cgColor
        passedView.layer.addSublayer(rightSideBorder)
        
        passedView.backgroundColor =  UIColor.init(red: (247.0/255.0), green: (249.0/255.0), blue: (78.0/255.0), alpha: 0.30)
    }
    
    
}
