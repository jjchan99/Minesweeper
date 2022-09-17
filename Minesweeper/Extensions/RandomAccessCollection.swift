//
//  GridGenerator.swift
//  Minesweeper
//
//  Created by jchan on 16/9/22.
//

import Foundation

extension RandomAccessCollection {
    subscript(index: Index) -> Element? {
        self.indices.contains(index) ? (self[index] as Element) : nil
    }
}
