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
    @IBOutlet weak var score: UITextField!
    @IBOutlet weak var time: UITextField!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        resetButtonTapped!()
        viewModel.reset()
    }
    
    private var resetButtonTapped: (() -> Void)?
    
    func pause(status: Status) {
        viewModel.pause(status: status)
    }
    
    func cellTapped() {
        viewModel.cellTapped()
    }
    
    func configure(resetButtonTapped: @escaping (() -> Void)) {
        bindToEvents()
        self.resetButtonTapped = resetButtonTapped
    }
    
    private func bindToEvents() {
        viewModel.countChanged = { [unowned self] count in
            time.text = "\(count)"
        }
        viewModel.scoreChanged = { [unowned self] score in
            self.score.text = "\(score)"
        }
        viewModel.faceChanged = { [unowned self] face in
            self.button.titleLabel?.text = face
        }
    }
    
   
}
