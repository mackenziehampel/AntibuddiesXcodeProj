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

//TODO: remove from CELLS
class PanelViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource, buttonTapped {
   
  @IBOutlet weak var tableView: UITableView!
    var cells = [Cells]()
    
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
        default:
            break
        }
     
       
    }
    
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
