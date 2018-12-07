//
//  GameManager.swift
//  Minesweeper
//
//  Created by Felix Changoo on 12/7/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

enum GameDifficulty {
    case Easy, Normal, Hard
}

class GameManager {
    typealias mineLocation = (Int, Int)
    var gameDifficulty: GameDifficulty
    var gameBoard = [[Grid]]()
    
    private var gameDiffToGameStatsDict: [GameDifficulty: GameDifficultyStats] = [:]
    private var mineLocations: [mineLocation]
    
    init(gameDifficulty: GameDifficulty = .Normal) {
        self.mineLocations = []
        self.gameBoard = []
        self.gameDifficulty = gameDifficulty
        
        createGameDiffStatsDict()
        createGame()
    }
    
    func createGame() {
        resetBoard()
        let gameStats = gameDiffToGameStatsDict[gameDifficulty]
        
        //this is dangerous to force unwrap but we know we definitely have gate stat objects
        let boardSize = gameStats!.boardSize
        let numOfMines = gameStats!.numOfMines
        
        //create board of size boardSize x boardSize
        createBoard(boardSize: boardSize)
        createMineLocations(numOfMines: numOfMines, boardSize: boardSize)
    }
    
    func setGameDifficulty(gameDifficulty: GameDifficulty) {
        self.gameDifficulty = gameDifficulty
    }
    
    private func createBoard(boardSize: Int) {
         gameBoard = Array(repeating: Array(repeating: Grid(), count: boardSize), count: boardSize)
    }
    
    private func resetBoard() {
        gameBoard.removeAll()
        mineLocations.removeAll()
    }
    
    private func createMineLocations(numOfMines: Int, boardSize: Int) {
        var remainingMines = numOfMines
        
        while remainingMines > 0 {
            let randomRow = Int.random(in: 0 ..< boardSize)
            let randomCol = Int.random(in: 0 ..< boardSize)
            
            let location: mineLocation = (randomRow, randomCol)
            let _ = gameBoard[randomRow][randomCol].hasMine = true
            
            mineLocations.append(location)
            remainingMines -= 1
        }
    }
    
    private func createGameDiffStatsDict() {
        gameDiffToGameStatsDict[.Normal] = GameDifficultyStats(boardSize: 7, numOfMines: 3)
        gameDiffToGameStatsDict[.Easy] = GameDifficultyStats(boardSize: 5, numOfMines: 1)
        gameDiffToGameStatsDict[.Hard] = GameDifficultyStats(boardSize: 10, numOfMines: 6)
    }
}
