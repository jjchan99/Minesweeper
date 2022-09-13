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
        MSlabel.text = data.bee ? "B" : "N"
    }
}
