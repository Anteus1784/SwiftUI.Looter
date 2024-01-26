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
    
    @EnvironmentObject var inventory : Inventory
    
    @State private var isAnimation : Bool = false
    @State private var selected : Bool = false
    
    @State var showEditItemView : Bool = false
    
    var body: some View {
        NavigationStack{
            
            GeometryReader { geo in
                VStack {
                    ZStack {
                        VStack{
                            Spacer()
                            
                            Text(item.type.getEmoji())
                                .padding()
                                .font(.system(size: 80))
                                .background(item.rarity.getColor())
                                .cornerRadius(25)
                            
                                .rotation3DEffect(
                                    .degrees(isAnimation ? 0 : 360), axis: (x: 2.0, y: 1.0, z: 0.0)
                                )
                                .animation(.spring, value: isAnimation)
                                .shadow(color: item.rarity.getColor(), radius: isAnimation ? 50 : 0 )
                                .animation(.bouncy.delay(0.2), value: isAnimation)
                                .onTapGesture {
                                    selected.toggle()
                                }
                                .scaleEffect(selected ? 1.5 : 1.0)
                                .animation(.bouncy, value: selected)
                                .task {
                                    try!
                                    await Task.sleep(nanoseconds: 4)
                                    isAnimation = true
                                }
                            
                            Spacer()
                            
                            Text(item.name).font(.title).bold().foregroundStyle(item.rarity.getColor())
                            
                            Spacer()
                            
                            if (item.rarity == Rarity.unique) {
                                Text("Item unique 🏆")
                                    .padding()
                                    .frame(width: 350)
                                    .background(item.rarity.getColor())
                                    .shadow(radius: 10).cornerRadius(10)
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(Color.white)
                                    .scaleEffect(isAnimation ? 1 : 0)
                                    .animation(.bouncy, value: isAnimation)
                                
                            }
                        }
                    }.frame(height: geo.size.height / 2)
                    
                    ZStack {
                        VStack{
                            List {
                                Section(header: Text("INFORMATIONS")){
                                    GameRow(item : item)
                                    
                                    Text("In-Game : \(item.name)")
                                    
                                    if let attackStrength = item.attackStrength {
                                        Text("Puissance (ATQ) \(attackStrength)")
                                    }
                                    
                                    Text("Possédé(s) : \(item.quantity)")
                                    
                                    Text("Rareté : \(String(describing: item.rarity).capitalized)")
                                }
                            }
                        }.frame(width: geo.size.width, height: geo.size.height/2)
                            .background(.regularMaterial)
                    }
                }
            }
        }.sheet(isPresented: $showEditItemView, content: {
            AddItemView(id: item.id, name: item.name, quantity: item.quantity, itemType: item.type, rarity: item.rarity, game: item.game, attackStrength: item.attackStrength ?? 0).environmentObject(inventory)
        })
        .toolbar(content: {
            ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                Button(action: {
                    showEditItemView.toggle()
                }, label: {
                    Image(systemName: "pencil")
                    Text("Modifier")
                })
            }
        })
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
