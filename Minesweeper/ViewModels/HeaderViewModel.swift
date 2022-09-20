//
//  HeaderViewModel.swift
//  Minesweeper
//
//  Created by jchan on 19/9/22.
//

import UIKit
import Combine

class HeaderViewModel {
    private(set) var timer: Timer?
    private var count: Int = 0
    private var score: Int = 0
    
    private func createTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1,
                                         repeats: true) { [weak self] timer in
            self?.count += 1
            self?.countChanged?(self!.count)
        }
        self.timer = timer
    }
    
    func cellTapped() {
        self.score += 1
        if timer == nil {
            createTimer()
        }
        scoreChanged?(self.score)
    }
    var countChanged: ((Int) -> Void)?
    var scoreChanged: ((Int) -> Void)?
    
    func pause() {
    if timer == nil {
        createTimer()
    }
    timer!.invalidate()
    }
}
