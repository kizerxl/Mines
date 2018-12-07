//
//  Grid.swift
//  Minesweeper
//
//  Created by Felix Changoo on 12/7/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

class Grid {
    var isRevealed: Bool
    var hasMine: Bool
    var mineCount: Int
    
    init() {
        isRevealed = false
        hasMine = false
        mineCount = 0
    }
}
