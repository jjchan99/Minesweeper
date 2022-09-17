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
        viewModel.generateGrid(row: 15, col: 8)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
           layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
           layout.minimumInteritemSpacing = 0
           layout.minimumLineSpacing = 0
           collectionView!.collectionViewLayout = layout
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
        let cell = viewModel.grid[indexPath.section][indexPath.row]
        cell.revealed.toggle()
        viewModel.reveal(cellAt: indexPath)
        self.collectionView.reloadData()
    }
}
