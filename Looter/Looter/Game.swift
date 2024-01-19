//
//  Game.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/19/24.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "Skyrim.png"),
    Game(name: "Skyrim", genre: .rpg, coverName: "Skyrim.png"),
    Game(name: "WoW", genre: .mmorpg, coverName: "World_Of_Warcraft.png"),
    Game(name: "CS:GO", genre: .fps, coverName: "CS.png"),
    Game(name: "Diablo IV", genre: .looter, coverName: "DiabloIV.png"),
    Game(name: "Hogwarts Legacy", genre: .rpg, coverName: "Hogwarts_Legacy.png")
]
