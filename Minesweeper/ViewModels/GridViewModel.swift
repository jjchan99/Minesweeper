//
//  GridViewModel.swift
//  Minesweeper
//
//  Created by jchan on 16/9/22.
//

import Foundation

class GridViewModel {
    var cells: [[Cell]] = [] 
    
    func generateCell() -> Cell {
        let mineFactor: Int = Int.random(in: 1...3)
        if mineFactor == 1 {
            return Cell(mine: true)
        } else {
            return Cell()
        }
    }
    
    func incrementNeighbouringMines(grid: [[Cell]]) {
        
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
    
    func generateGrid(row: Int, col: Int) -> [[Cell]] {
        var grid = [[Cell]]()
        for i in 0..<row {
            grid.append([])
            for _ in 0..<col {
                grid[i].append(generateCell())
            }
        }
        
//        incrementNeighbouringMines(grid: grid)
        return grid
    }
    
}
