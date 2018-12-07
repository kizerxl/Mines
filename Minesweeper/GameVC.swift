//
//  ViewController.swift
//  Minesweeper
//
//  Created by Felix Changoo on 12/7/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    var gameManager = GameManager()
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
    }
}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return gameManager.gameBoard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameManager.gameBoard[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as? GridCell else {
            fatalError("Cell not found!")
        }
        
        let grid = gameManager.gameBoard[indexPath.section][indexPath.row]
        let boardSize = gameManager.gameBoard.count
        
        cell.frame.size.width = screenWidth / CGFloat(boardSize)
        cell.frame.size.height = screenWidth / CGFloat(boardSize)
        cell.configureCell(with: grid)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let grid = gameManager.gameBoard[indexPath.section][indexPath.row]
        grid.isRevealed = true
        
        //should check for adjacent cells
        //algorithm to adjust models goes here
        
        collectionView.reloadItems(at: [indexPath])
    }
    
}



