//
//  MSCollectionViewController.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 13/9/22.
//

import UIKit
import Combine

class GridViewController: UICollectionViewController {
     
    var viewModel = GridViewModel() 
    var headerView: HeaderView?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.generateGrid(row: 15, col: 10)
    }
    
    private func observeStatusChange() {
        viewModel.statusChanged = { [unowned self] status in
            switch status {
            case .l:
                headerView!.pause()
            case .tbc:
                break
            case .w:
                break
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
              ofKind: kind,
              withReuseIdentifier: "HeaderView",
              for: indexPath) as! HeaderView
        if self.headerView == nil {
            headerView.configure()
            headerView.reset = { [unowned self] in
                reset()
            }
            observeStatusChange()
            self.headerView = headerView
            return headerView
        } else {
            return self.headerView!
        }
    }
    
    private func reset() {
        viewModel.generateGrid(row: 15, col: 10)
        headerView?.configure()
        self.collectionView.reloadData()
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
        headerView?.cellTapped()
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
