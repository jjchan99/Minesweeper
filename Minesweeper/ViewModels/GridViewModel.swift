//
//  GridViewModel.swift
//  Minesweeper
//
//  Created by jchan on 16/9/22.
//

import Foundation

class GridViewModel {
    var grid: [[Cell]] = []
    
    init() {
        self.grid = generateGrid(row: 10, col: 5)
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
    
    func generateGrid(row: Int, col: Int) -> [[Cell]] {
        var grid = [[Cell]]()
        for i in 0..<row {
            grid.append([])
            for _ in 0..<col {
                grid[i].append(generateCell())
            }
        }
        
        incrementNeighbouringMines()
        return grid
    }
    
}

extension GridViewModel {
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
    
    private func incrementNeighbouringMines() {
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
               let n = locateNeighbours(cellAt: IndexPath(row: j, section: i))
                
                for p in n {
                    let cell = grid[p.i][p.j]
                    cell.neighbouringMines += 1
                }
            }
        }
    }
    
    private func generateCell() -> Cell {
        let mineFactor: Int = Int.random(in: 1...3)
        if mineFactor == 1 {
            return Cell(mine: true)
        } else {
            return Cell()
        }
    }
}
