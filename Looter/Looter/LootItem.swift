//
//  LootItem.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/19/24.
//

import Foundation
import SwiftUI

enum ItemType {
    static var allCases: [ItemType] {
        return [
            .magic,
            .fire,
            .ice,
            .wind,
            .poison,
            .thunder,
            .dagger,
            .shield,
            .bow,
            .ring,
            .unknown
        ]
    }
    
    case magic
    case fire
    case ice
    case wind
    case poison
    case thunder
    case dagger
    case shield
    case bow
    case ring
    case unknown
    
    func getEmoji() -> String {
        switch self {
        case .magic :
            return "⭐️"
        case .fire :
            return "🔥"
        case .ice :
            return "❄️"
        case .wind :
            return "💨"
        case .poison :
            return "☠️"
        case .thunder :
            return "⚡️"
        case .dagger :
            return "🗡️"
        case .shield :
            return "🛡️"
        case .bow :
            return "🏹"
        case .ring :
            return "💍"
        case .unknown :
            return "🎲"
        }
    }
}

enum Rarity : CaseIterable{
    static var allCases: [Rarity] {
        return [ .common,
                 .uncommon,
                 .rare,
                 .epic,
                 .legendary,
                 .unique
        ]
    }
    
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
    
    func getColor() -> Color {
        switch self {
        case .common :
            return .brown
        case .uncommon :
            return .green
        case .rare :
            return .blue
        case .epic :
            return .purple
        case .legendary :
            return .yellow
        case .unique :
            return .indigo
        }
    }
}

struct LootItem : Identifiable {
    let id = UUID()
    var quantity : Int
    var name : String
    var type : ItemType
    var rarity : Rarity
    var attackStrength : Int?
    var game : Game
}
