//
//  LootDetailView.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/19/24.
//

import Foundation
import SwiftUI

struct LootDetailView: View {
    
    var item: LootItem
    
    var body: some View {
        Text(item.name)
    }
}

#Preview {
    LootDetailView(item : LootItem(quantity : 1,
                            name : "Baguette ancienne",
                            type : ItemType.magic,
                            rarity : Rarity.unique,
                            attackStrength : 1,
                            game : availableGames[5]
                       ))
}
