//
//  CellViewModel.swift
//  Minesweeper
//
//  Created by jchan on 16/9/22.
//

import Foundation

class CellViewModel {
    var cell: Cell? {
        willSet {
        
        }
        
        didSet {
            text = cell!.revealed ?
               cell!.mine ?
                   "X" :
                       cell?.neighbouringMines == 0 ?
                          "O" :
                          "\(cell!.neighbouringMines)"
            : "?"
        }
    }
    
    var text: String = ""
}
