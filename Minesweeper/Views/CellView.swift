//
//  File.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 13/9/22.
//

import UIKit

class CellView: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    var viewModel = CellViewModel()
    
    func configure(cell: Cell) {
        viewModel.cell = cell
        self.label.text = viewModel.text
    }
}
