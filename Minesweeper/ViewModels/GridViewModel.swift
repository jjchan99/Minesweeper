//
//  GridViewModel.swift
//  Minesweeper
//
//  Created by jchan on 16/9/22.
//

import Foundation

//Create game engine as singleton

//State machine

//Noficiation centre. Observer pattern

//Delegate pattern

class GridViewModel {
    private var status: Status = .tbc {
        didSet {
            statusChanged?(status)
        }
    }
    var statusChanged: ((Status) -> Void)?
    
    var grid: [[Cell]] = []
    
    func reveal(cellAt p: IndexPath) {
        let current = grid[p.i][p.j]
        guard !current.mine else {
            status = .l
            revealAll()
            return
        }
        current.revealed = true
        guard current.neighbouringMines == 0 else { return }
        for p in locateNeighbours(cellAt: p) {
                guard !grid[p.i][p.j].mine else { break }
                guard !grid[p.i][p.j].revealed else { continue }
                reveal(cellAt: p)
        }
        
        if noRemainingMines() {
            status = .w
        }
    }
    
    private func noRemainingMines() -> Bool {
        for row in grid {
            for cell in row {
                if !cell.revealed && !cell.mine {
                    return false
                }
            }
        }
        return true
    }
    
    func generateGrid(row: Int, col: Int) {
        self.grid = [[]]
        for i in 0..<row {
            grid.append([])
            for _ in 0..<col {
                grid[i].append(generateCell())
            }
        }
        
        incrementNeighbouringMines()
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
                guard grid[i][j].mine else { continue }
                let n = locateNeighbours(cellAt: IndexPath(row: j, section: i))
                
                for p in n {
                    grid[p.i][p.j].neighbouringMines += 1
                }
            }
        }
    }
    
    private func generateCell() -> Cell {
        let mineFactor: Int = Int.random(in: 1...5)
        if mineFactor == 1 {
            return Cell(mine: true)
        } else {
            return Cell()
        }
    }
    
    private func revealAll() {
        grid.forEach { section in
            section.forEach { cell in
                cell.revealed = true
            }
        }
    }
}
