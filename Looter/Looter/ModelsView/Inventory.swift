//
//  Inventory.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/26/24.
//

import Foundation


class Inventory : ObservableObject {
    @Published var loot : [LootItem] = [
        LootItem(quantity : 1,
                 name : "Baguette ancienne",
                 type : ItemType.magic,
                 rarity : Rarity.unique,
                 attackStrength : 1,
                 game : availableGames[5]
            ),
        LootItem(quantity : 3,
                 name : "Flingue",
                 type : ItemType.bow,
                 rarity : Rarity.common,
                 attackStrength : 5,
                 game : availableGames[4]
            ),
        LootItem(quantity : 4,
                 name : "Dague de sang",
                 type : ItemType.dagger,
                 rarity : Rarity.rare,
                 attackStrength : 9,
                 game : availableGames[1]
            )
    ]
    
    func addItem(item : LootItem) {
        loot.append(item)
    }
    
    func removeItem(itemIndex : IndexSet){
        loot.remove(atOffsets: itemIndex)
    }
}
