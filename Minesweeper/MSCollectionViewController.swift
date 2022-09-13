//
//  MSCollectionViewController.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 13/9/22.
//

import UIKit

class MSCollectionViewController: UICollectionViewController {
     
    let dataSource: [[MSCellData]] = MSGame.generateGrid(row: 5, col: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad()")

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = MSCollectionViewCell()
        
        if let MSCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MSCollectionViewCell {
            
            MSCell.configure(data: dataSource[indexPath.section][indexPath.row])
            
            cell = MSCell
        } else {
            fatalError()
        }
        
        return cell
    }
}
