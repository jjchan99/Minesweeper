//
//  CellViewModel.swift
//  Minesweeper
//
//  Created by jchan on 16/9/22.
//

import UIKit

class CellViewModel {
    var cell: Cell? {
        willSet {
        
        }
        
        didSet {
            text = cell!.revealed ?
               cell!.mine ?
                   "💣" :
                       cell?.neighbouringMines == 0 ?
                          "" :
                          "\(cell!.neighbouringMines)"
            : ""
        }
    }
    
    var backgroundColor: UIColor? {
        cell?.revealed ?? false ? .lightGray : .darkGray
    }
    
    var text: String = ""
    
    var backgroundColorChanged: (())
}
