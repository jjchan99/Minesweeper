//
//  MSCell.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 13/9/22.
//

import Foundation

class Cell {
    init(mine: Bool = false, revealed: Bool = false, neighbouringMines: Int = 0) {
        self.mine = mine
        self.revealed = revealed
        self.neighbouringMines = neighbouringMines
    }
    
    var mine: Bool = false
    var revealed: Bool = false {
        didSet {
            print("grid value changed")
        }
    }
    var neighbouringMines: Int = 0 {
        didSet {
            print("+1")
        }
    }
}
