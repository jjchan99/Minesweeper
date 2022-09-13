//
//  File.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 13/9/22.
//

import UIKit

class MSCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var MSlabel: UILabel!
    
    func configure(data: MSCellData) {
        guard data.revealed else {
            MSlabel.text = "?"
            return
        }
        MSlabel.text = data.mine ? "O" : "N"
    }
}
