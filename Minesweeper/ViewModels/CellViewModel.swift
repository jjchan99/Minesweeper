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
            text = cell!.revealed ? "X" : "?"
        }
    }
    
    var text: String = ""
}
