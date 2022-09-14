//
//  MSCell.swift
//  Minesweeper
//
//  Created by Jia Jie Chan on 13/9/22.
//

import Foundation

class MSCellData {
    init(mine: Bool = false, revealed: Bool = true, neighbouringMines: Int = 0) {
        self.mine = mine
        self.revealed = revealed
        self.neighbouringMines = neighbouringMines
    }
    
    var mine: Bool = false
    var revealed: Bool = true
    var neighbouringMines: Int = 0
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
    
    static private func incrementNeighbouringMines(grid: [[MSCellData]]) {
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                
                let c = grid[i][j]
                
                let u = grid[i - 1][j]
                let ur = grid[i - 1][j + 1]
                let r = grid[i][j + 1]
                let dr = grid[i + 1][j + 1]
                let d = grid[i + 1][j]
                let dl = grid[i + 1][j - 1]
                let l = grid[i][j - 1]
                let ul = grid[i - 1][j - 1]
                
                if c.mine {
                    for cell in [u, ur, r, dr, d, dl, l, ul] {
                        cell.neighbouringMines += 1
                    }
                }
            }
        }
    }
    
    static func generateGrid(row: Int, col: Int) -> [[MSCellData]] {
        var grid = [[MSCellData]]()
        for i in 0..<row {
            grid.append([])
            for _ in 0..<col {
                grid[i].append(MSGame.generateCell())
            }
        }
        
//        incrementNeighbouringMines(grid: grid)
        return grid
    }
}

extension RandomAccessCollection {
    subscript(index: Index) -> Element? {
        self.indices.contains(index) ? (self[index] as Element) : nil
    }
}

