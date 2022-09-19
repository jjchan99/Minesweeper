//
//  HeaderView.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 18/9/22.
//

import UIKit
import Combine

class HeaderView: UICollectionReusableView {
    var subscribers = Set<AnyCancellable>()
    var viewModel = HeaderViewModel()
    @IBOutlet weak var button: UIButton!
  
    @IBOutlet weak var score: UITextField!
    
    @IBOutlet weak var time: UITextField!
    
    func configure() {
        viewModel.createTimer()
        viewModel.count.sink { count in
            self.time.text = "\(count)"
        }.store(in: &subscribers)
    }
}
