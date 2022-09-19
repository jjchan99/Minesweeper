//
//  HeaderView.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 18/9/22.
//

import UIKit

class HeaderView: UICollectionReusableView {
    var viewModel = HeaderViewModel()
    @IBOutlet weak var button: UIButton!
  
    @IBOutlet weak var score: UITextField!
    
    @IBOutlet weak var time: UITextField!
    
    func configure() {
        viewModel.createTimer()
        self.time.text = "\(viewModel.count)"
    }
}
