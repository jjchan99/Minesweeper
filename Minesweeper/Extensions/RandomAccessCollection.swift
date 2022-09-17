//
//  GridGenerator.swift
//  Minesweeper
//
//  Created by jchan on 16/9/22.
//

import Foundation

extension RandomAccessCollection {
    subscript(optional i: Index) -> Iterator.Element? {
        return self.indices.contains(i) ? self[i] : nil
    }
}
