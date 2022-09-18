//
//  HeaderView.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 18/9/22.
//

import UIKit

class HeaderView: UICollectionReusableView {
  @IBOutlet weak var button: UIButton!
    
    func configure(indexPath: IndexPath) {
        if indexPath.section != 0 {
            self.isHidden = true
        }
    }
}