//
//  MSCell.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 13/9/22.
//

import Foundation

struct MSCellData {
    var mine: Bool = false
    var revealed: Bool = false
}

struct MSGame {
    static private func generateCell() -> MSCellData {
        let mineFactor: Int = Int.random(in: 1...3)
        if mineFactor == 1 {
            return MSCellData(mine: true)
        } else {
            return MSCellData()
        }
    }
    
    static func generateGrid(row: Int, col: Int) -> [[MSCellData]] {
        var grid = [[MSCellData]]()
        for i in 0..<col {
            grid.append([])
            for j in 0..<row {
                grid[i].append(MSGame.generateCell())
            }
        }
        return grid
    }
    
    
    
}
