//
//  LootRow.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/23/24.
//

import Foundation
import SwiftUI

struct LootRow: View {
    
    var item : LootItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Circle().fill(item.rarity.getColor()).frame(height: 12)
                Text(item.name)
                Spacer(minLength: 50)
                Text(item.type.getEmoji())
            }
            HStack(alignment: .center) {
                Text("Quantité : \(item.quantity)")
            }
        }
    }
}
