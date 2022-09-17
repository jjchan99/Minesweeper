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
        self.backgroundColor = viewModel.backgroundColor
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
}
