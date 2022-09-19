//
//  HeaderViewModel.swift
//  Minesweeper
//
//  Created by jchan on 19/9/22.
//

import UIKit
import Combine

class HeaderViewModel {
    var timer = Timer()
    func createTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 2,
                                         repeats: true) { timer in
            self.count.value += 1
            
        }
        self.timer = timer
    }
    var count: CurrentValueSubject<Int, Never> = CurrentValueSubject(0)
    var score: CurrentValueSubject<Int, Never> = CurrentValueSubject(0) {
        didSet {
            print("score updated: \(score)")
        }
    }
}
