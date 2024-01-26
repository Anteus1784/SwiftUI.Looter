//
//  LootView.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/26/24.
//

import Foundation
import SwiftUI

struct LootView: View {
    
    @EnvironmentObject var inventory : Inventory
    
    @State var showAddItemView : Bool = false
    
    let action : () -> Void
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink() {
                        LootDetailView(item: item).environmentObject(inventory)
                    } label: {
                        LootRow(item: item)
                    }
                }.onDelete(perform: { indexSet in
                    inventory.removeItem(itemIndex: indexSet)
                })
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
            .navigationBarTitle("💼 Inventaire")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    HStack {
                        Button(action: {
                            showAddItemView.toggle()
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                    })
                        Button(action: {
                            action()
                        }, label: {
                            Image(systemName: "minus.rectangle.portrait.fill")
                    })
                    }
                }
            })
        }
    }
}

#Preview {
    LootView(action: {})
}
