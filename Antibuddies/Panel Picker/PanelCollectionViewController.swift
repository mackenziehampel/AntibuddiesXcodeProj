//
//  PanelCollectionViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/6/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class PanelCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    let object = ["1", "2", "3","4","5","6","7","8","9","10","11"]
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
    //    self.collectionView.regis
       self.collectionView.register(UINib(nibName: "PanelPickerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:
        String(describing: PanelPickerCollectionViewCell.self))
        //self.collectionView.register(PanelPickerCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PanelPickerCollectionViewCell.self))
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return object.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PanelPickerCollectionViewCell", for: indexPath) as! PanelPickerCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PanelPickerCollectionViewCell", for: indexPath) as! PanelPickerCollectionViewCell
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
       // cell.text = self.items[indexPath.item]
       // cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        cell.setUpCard(number: object[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        if indexPath.row == 0 {

//            performSegue(withIdentifier: "PanelViewController", sender: cell)
            let detailController = UIStoryboard(name: "Panel", bundle: nil).instantiateViewController(withIdentifier: "PanelViewController") as! PanelViewController
           self.present(detailController, animated: true, completion: nil)
            //self.navigationController?.pushViewController(detailController, animated: true)
        }
        

    }
    
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
