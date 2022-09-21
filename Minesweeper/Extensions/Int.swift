//
//  CGFloat.swift
//  Minesweeper
//
//  Created by jchan on 21/9/22.
//

import UIKit

fileprivate var w = UIScreen.main.bounds.width
fileprivate var h = UIScreen.main.bounds.height
fileprivate var w13: Int = 428
fileprivate var h13: Int = 926

extension Int {
   
    
    var hScaled: Int {
        return self * ( Int(h)/h13 )
    }
}
