//
//  MSCollectionViewController.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 13/9/22.
//

import UIKit

class GridViewController: UICollectionViewController {
     
    var viewModel = GridViewModel() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.generateGrid(row: 15, col: 10)
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//           layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//           layout.minimumInteritemSpacing = 0
//           layout.minimumLineSpacing = 0
//           layout.itemSize = CGSize(width: 40, height: 40)
//           collectionView!.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
              ofKind: kind,
              withReuseIdentifier: "HeaderView",
              for: indexPath) as! HeaderView
            return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.grid[section].count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.grid.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = viewModel.grid[indexPath.section][indexPath.row]
        
        if let cellView = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CellView {
           
            cellView.configure(cell: cell)
            
            return cellView
        } else {
            fatalError()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.reveal(cellAt: indexPath)
        self.collectionView.reloadData()
    }
}

extension GridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        if section != 0 {
        return CGSize.zero
        } else {
        return CGSize(width: 100, height: 100)
        }
    }
}
