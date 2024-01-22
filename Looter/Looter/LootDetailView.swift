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
        GeometryReader { geo in
            
            VStack {
                
                ZStack {
                    VStack{
                        Text(item.type.getEmoji())
                            .padding()
                            .font(.system(size: 80))
                            .background(item.rarity.getColor())
                            .cornerRadius(25)
                            .frame(width: geo.size.width/3, height: geo.size.height/3)
                        
                        Text(item.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundStyle(item.rarity.getColor())
                        
                        Spacer()
                        
                        if (item.rarity.currentCase() == "Unique") {
                            Text("Item unique 🏆")
                                .cornerRadius(50)
                                .frame(width: geo.size.width - 50)
                                .padding()
                                .font(.title2)
                                .bold()
                                
                                .foregroundStyle(Color.white)
                                .background(item.rarity.getColor())
                        }
                    }
                }.frame(height: geo.size.height/2)
                
                ZStack {
                    VStack{
                        List {
                            Section(header: Text("INFORMATIONS")){
                                HStack{
                                    if let imageCoverName = item.game.coverName, let imageCover = UIImage(named: imageCoverName)
                                    {
                                        Image(uiImage: imageCover)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 75)
                                            .cornerRadius(10)
                                    } else {
                                        Image(systemName: "square.slash")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 75)
                                    }
                                    Text(item.game.name)
                                }
                                Text("In-Game : \(item.name)")
                                if let attackStrength = item.attackStrength {
                                    Text("Puissance (ATQ) \(attackStrength)")
                                }
                                Text("Possédé(s) : \(item.quantity)")
                                Text("Rareté : \(item.rarity.currentCase())")
                            }
                        }
                    }.frame(width: geo.size.width, height: geo.size.height/2)
                        .background(.regularMaterial)
                }
            }
        }
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
