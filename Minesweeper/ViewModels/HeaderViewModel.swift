//
//  HeaderViewModel.swift
//  Minesweeper
//
//  Created by jchan on 19/9/22.
//

import UIKit

class HeaderViewModel {
    var timer = Timer()
    func createTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 2,
                                         repeats: true) { timer in
            self.count += 1
            
        }
        self.timer = timer
    }
    var count: Int = 0 
}
