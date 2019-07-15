//
//  PanelViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/4/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

struct Cells {
    var cell = PanelMainCell()
    var buttonColumn = String()
    var tag = Int()
    var row = Int() //so we can send row answers to server
}

protocol AllelicSwitchDelegate {
    func turnOnAllelicPairs()
    func turnOffAllelicPairs()
}
//TODO: remove from CELLS
class PanelViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource, buttonTapped {
   
  @IBOutlet weak var tableView: UITableView!
    var cells = [Cells]()
    @IBOutlet weak var allelicSwitch: UISwitch!
    var allelicDelegate: AllelicSwitchDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "PanelCell", bundle: nil), forCellReuseIdentifier: "PanelCell")
        self.tableView.register(UINib(nibName: "PanelMainCell", bundle: nil), forCellReuseIdentifier: "PanelMainCell")
        tableView.backgroundView?.backgroundColor = .clear
       
       // tableView.allowsSelection = false;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PanelCell", for: indexPath) as! PanelCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PanelMainCell", for: indexPath) as! PanelMainCell
            cell.greyNumberLbl.text = indexPath.row.description
            cell.delegate = self
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("here")
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        print("HERE")
        //somehow pass in the correct cell
        
        //po sender.view.tag
        for c in cells {
            if sender.view!.tag == c.tag {
                self.buttonTapped(cell: c.cell, buttonColumn: c.buttonColumn)
            }
        }
    }
    
    func buttonTapped(cell: PanelMainCell, buttonColumn: String) {
        //send in button
        //button.titleLabel?.text = "/"
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
       
        var x = false
        let oneCell = cell.D.frame.origin.y
        switch buttonColumn {
        case "D":
            let v = ViewWithDiagonalLine()
            v.frame = cell.D.bounds
            v.tag = Int("\(0)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.D.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
              cell.D.addSubview(v)
            }
        
            cells.append(Cells(cell: cell, buttonColumn: "D", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "BigC":
            let v = ViewWithDiagonalLine()
            v.frame = cell.bigC.bounds
            v.tag = Int("\(1)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.bigC.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.bigC.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "BigC", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "LittleC":
            let v = ViewWithDiagonalLine()
            v.frame = cell.littleC.bounds
            v.tag = Int("\(2)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.littleC.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.littleC.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "LittleC", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "LittleE":
            let v = ViewWithDiagonalLine()
            v.frame = cell.littleE.bounds
            v.tag = Int("\(3)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.littleE.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.littleE.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "LittleE", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "BigE":
            let v = ViewWithDiagonalLine()
            v.frame = cell.bigE.bounds
            v.tag = Int("\(4)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.bigE.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.bigE.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "BigE", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "F":
            let v = ViewWithDiagonalLine()
            v.frame = cell.f.bounds
            v.tag = Int("\(5)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.f.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.f.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "F", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "V":
            let v = ViewWithDiagonalLine()
            v.frame = cell.V.bounds
            v.tag = Int("\(6)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.V.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.V.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "V", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "Cw":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Cw.bounds
            v.tag = Int("\(7)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Cw.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Cw.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "Cw", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "BigK":
            let v = ViewWithDiagonalLine()
            v.frame = cell.BigK.bounds
            v.tag = Int("\(8)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.BigK.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.BigK.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "BigK", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "LittleK":
            let v = ViewWithDiagonalLine()
            v.frame = cell.littleK.bounds
            v.tag = Int("\(9)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.littleK.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.littleK.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "LittleK", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "KPA":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Kpa.bounds
            v.tag = Int("\(10)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Kpa.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Kpa.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "KPA", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "KPB":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Kpb.bounds
            v.tag = Int("\(11)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Kpb.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Kpb.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "KPB", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "JSA":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Jsa.bounds
            v.tag = Int("\(12)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Jsa.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Jsa.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "JSA", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "JSB":
            let v = ViewWithDiagonalLine()
            v.frame = cell.JSb.bounds
            v.tag = Int("\(13)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.JSb.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.JSb.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "JSB", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "FYA":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Fya.bounds
            v.tag = Int("\(13)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Fya.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Fya.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "FYA", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "FYB":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Fyb.bounds
            v.tag = Int("\(14)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Fyb.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Fyb.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "FYB", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "JKA":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Jka.bounds
            v.tag = Int("\(15)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Jka.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Jka.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "JKA", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "JKB":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Jkb.bounds
            v.tag = Int("\(16)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Jkb.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Jkb.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "JKB", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "LEA":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Lea.bounds
            v.tag = Int("\(17)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Lea.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Lea.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "LEA", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "LEB":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Leb.bounds
            v.tag = Int("\(18)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Leb.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Leb.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "LEB", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "P1":
            let v = ViewWithDiagonalLine()
            v.frame = cell.P1.bounds
            v.tag = Int("\(19)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.P1.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.P1.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "P1", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "M":
            let v = ViewWithDiagonalLine()
            v.frame = cell.M.bounds
            v.tag = Int("\(20)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.M.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.M.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "M", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "N":
            let v = ViewWithDiagonalLine()
            v.frame = cell.N.bounds
            v.tag = Int("\(21)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.N.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.N.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "N", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "BigS":
            let v = ViewWithDiagonalLine()
            v.frame = cell.S.bounds
            v.tag = Int("\(22)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.S.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.S.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "BigS", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "LittleS":
            let v = ViewWithDiagonalLine()
            v.frame = cell.littleS.bounds
            v.tag = Int("\(23)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.littleS.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.littleS.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "LittleS", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "LUA":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Lua.bounds
            v.tag = Int("\(24)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Lua.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Lua.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "LUA", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
            
        case "LUB":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Lub.bounds
            v.tag = Int("\(25)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Lub.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Lub.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "LUB", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        case "XGA":
            let v = ViewWithDiagonalLine()
            v.frame = cell.Xga.bounds
            v.tag = Int("\(26)\(tableView.indexPath(for: cell)!.row)")!
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.addGestureRecognizer(gesture)
            for view in cell.Xga.subviews {
                if let subView = view as? ViewWithDiagonalLine {
                    subView.removeFromSuperview()
                    x = true
                    break
                }
                
            }
            if x == false {
                cell.Xga.addSubview(v)
            }
            cells.append(Cells(cell: cell, buttonColumn: "XGA", tag: v.tag, row: tableView.indexPath(for: cell)!.row))
            break
        default:
            break
        }
     
       
    }
    
    @IBAction func didSwitchAllelicPair(_ sender: Any) {
        if allelicSwitch.isOn {
            self.allelicDelegate?.turnOnAllelicPairs()
        } else {
           // allelicDelegate.turnOffAllelicPairs()
        }
        
    }
    
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
