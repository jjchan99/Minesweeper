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
    @IBAction func buttonPressed(_ sender: UIButton) {
        reset!()
    }
    
    var reset: (() -> Void)?
    
    @IBOutlet weak var score: UITextField!
    
    @IBOutlet weak var time: UITextField!
    
    func configure() {
        viewModel = HeaderViewModel()
        subscribers = Set<AnyCancellable>()
        viewModel.count.sink { count in
            self.time.text = "\(count)"
        }.store(in: &subscribers)
        viewModel.score.sink { score in
            self.score.text = "\(score)"
        }.store(in: &subscribers)
    }
    
    func cellTapped() {
        viewModel.cellTapped()
    }
}
