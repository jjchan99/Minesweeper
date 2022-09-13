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

class MSGrid {
    var grid = [[MSCellData]]()
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
    
    static func incrementNeighbouringMines(grid: MSGrid, i: Int, j: Int) {
        let grid = grid.grid
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
    
    static func generateGrid(row: Int, col: Int) -> MSGrid {
        let msgrid = MSGrid()
        for i in 0..<row {
            msgrid.grid.append([])
            for j in 0..<col {
                msgrid.grid[i].append(MSGame.generateCell())
//                incrementNeighbouringMines(grid: msgrid, i: i, j: j)
            }
        }
        return msgrid
    }
    
    
    
}
