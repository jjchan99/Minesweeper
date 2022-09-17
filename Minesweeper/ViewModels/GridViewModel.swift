//
//  GridViewModel.swift
//  Minesweeper
//
//  Created by jchan on 16/9/22.
//

import Foundation

class GridViewModel {
    var grid: [[Cell]] = []
    
    func generateCell() -> Cell {
        let mineFactor: Int = Int.random(in: 1...3)
        if mineFactor == 1 {
            return Cell(mine: true)
        } else {
            return Cell()
        }
    }
    
    func reveal(cellAt p: IndexPath) {
        var stack: [IndexPath] = [p]
        
        while !stack.isEmpty {
            
            let current = grid[p.i][p.j]
            current.revealed.toggle()
            
            for p in locateNeighbours(cellAt: p) {
                
                guard !grid[p.i][p.j].mine else { continue }
                stack.append(p)
            }
        }
    }
    
    private func locateNeighbours(cellAt p: IndexPath) -> [IndexPath] {
        let i = p.i
        let j = p.j
        var n: [IndexPath] = []
        
        if let u = grid[optional: i - 1]?[optional: j] {  n.append(IndexPath(row: j, section: i - 1))   }
        if let ur = grid[optional: i - 1]?[optional: j + 1] {  n.append(IndexPath(row: j + 1, section: i - 1))   }
        if let r = grid[optional: i]?[optional: j + 1] {  n.append(IndexPath(row: j + 1, section: i))   }
        if let dr = grid[optional: i + 1]?[optional: j + 1] {  n.append(IndexPath(row: j + 1, section: i + 1))   }
        if let d = grid[optional: i + 1]?[optional: j] {  n.append(IndexPath(row: j, section: i + 1))   }
        if let dl = grid[optional: i + 1]?[optional: j - 1] {  n.append(IndexPath(row: j - 1, section: i + 1))   }
        if let l = grid[optional: i]?[optional: j - 1] {  n.append(IndexPath(row: j - 1, section: i))   }
        if let ul = grid[optional: i - 1]?[optional: j - 1] {  n.append(IndexPath(row: j - 1, section: i - 1))   }
        
        return n
    }
    
    func incrementNeighbouringMines() {
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                
                let c = grid[i][j]
                
                let u = grid[optional: i - 1]?[optional: j]
                let ur = grid[optional: i - 1]?[optional: j + 1]
                let r = grid[optional: i]?[optional: j + 1]
                let dr = grid[optional: i + 1]?[optional: j + 1]
                let d = grid[optional: i + 1]?[optional: j]
                let dl = grid[optional: i + 1]?[optional: j - 1]
                let l = grid[optional: i]?[optional: j - 1]
                let ul = grid[optional: i - 1]?[optional: j - 1]
                
                if c.mine {
                    for cell in [u, ur, r, dr, d, dl, l, ul] {
                        guard let cell = cell else { continue }
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
