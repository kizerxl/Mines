//
//  GridCell.swift
//  Minesweeper
//
//  Created by Felix Changoo on 12/7/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    @IBOutlet weak var gridLabel: UILabel!
    
    func configureCell(with grid: Grid) {
        let mineCount = grid.mineCount
        let hasMine = grid.hasMine
        let isRevealed = grid.isRevealed
        
        gridLabel.text = ""
        
        if isRevealed {
            gridLabel.text = "X"
        } else if isRevealed && mineCount > 0 && !hasMine {
            gridLabel.text = "\(mineCount)"
        }
    }
}
