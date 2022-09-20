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
    private var count: Int = 0 {
        didSet {
            countChanged?(count)
        }
    }
    private var score: Int = 0 {
        didSet {
            scoreChanged?(score)
        }
    }
    
    private func createTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1,
                                         repeats: true) { [weak self] timer in
            self?.count += 1
        }
        self.timer = timer
    }
    
    func reset() {
        count = 0
        score = 0
        timer?.invalidate()
        timer = nil
    }
    
    func cellTapped() {
        self.score += 1
        if timer == nil {
            createTimer()
        }
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
