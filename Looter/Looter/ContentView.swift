//
//  ContentView.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/19/24.
//

import SwiftUI

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
    
    func addItem(item: String) {
        loot.append(LootItem(quantity : 6,
                             name : "Pouvoir du Test",
                             type : ItemType.fire,
                             rarity : Rarity.uncommon,
                             attackStrength : 7,
                             game : availableGames[3]
                        ))
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView : Bool = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink() {
                        LootDetailView(item: item)
                    } label: {
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
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
            .navigationBarTitle("💼 Inventaire")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
