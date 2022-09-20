//
//  HeaderView.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 18/9/22.
//

import UIKit
import Combine

class HeaderView: UICollectionReusableView {
    var viewModel = HeaderViewModel()
    @IBOutlet weak var button: UIButton!
    @IBAction func buttonPressed(_ sender: UIButton) {
        reset!()
    }
    
    var reset: (() -> Void)?
    
    func pause() {
        if viewModel.timer == nil {
            viewModel.createTimer()
        }
        viewModel.timer!.invalidate()
    }
    
    @IBOutlet weak var score: UITextField!
    
    @IBOutlet weak var time: UITextField!
    
    func configure() {
        viewModel = HeaderViewModel()
        bindToEvents()
    }
    
    private func bindToEvents() {
        viewModel.countChanged = { [unowned self] count in
            time.text = "\(count)"
        }
        viewModel.scoreChanged = { [unowned self] score in
            self.score.text = "\(score)"
        }
    }
    
    func cellTapped() {
        viewModel.cellTapped()
    }
}
