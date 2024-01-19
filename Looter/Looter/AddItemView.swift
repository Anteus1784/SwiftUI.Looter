//
//  AddItemView.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/19/24.
//

import Foundation
import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var inventory: Inventory
    
    @State var name : String = ""
    @State var quantity: Int = 0
    @State var itemType : ItemType = .unknown
    @State var rarity : Rarity = Rarity.common
    @State var game : Game = .emptyGame
    @State var attackStrength : Int = 0
    @State private var areTogglesOn: Bool = false
    
    var body: some View {
        
        Form {
            Section{
                TextField("Nom de l'objet", text: $name)
            }
            Section {
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $game) {
                    Text("Non spécifié").tag(Optional<String>(nil))
                    ForEach(availableGames, id: \.self) { game in
                        Text(String(describing: game.name).capitalized)
                    }
                }
            }
            
            Section {
                Stepper(value: $quantity,
                        in: 1...100,
                        step: 1) {
                    Text("Quantité: \(quantity)")
                }
            }
            
            Section {
                HStack {
                    Text("Type :")
                    Spacer(minLength: 50)
                    Text(itemType.getEmoji())
                }
                Picker("Type", selection: $itemType) {
                    ForEach(ItemType.allCases, id: \.self) { itemType in
                        Text(itemType.getEmoji())
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section{
                Toggle("Item d'attaque ?", isOn: $areTogglesOn)
                Stepper(value: $attackStrength,
                        in: 0...10,
                        step: 1) {
                    Text("Force d'attaque : \(attackStrength)")}
            //TODO: Faire en sorte de rendre attackStrength Int?
                
            }
        }
        
        Section {
            Button(action: {
                inventory.addItem(item: name)
                dismiss()
            }, label: {
                Text("Ajouter l'objet")
            })
        }
    }
}

#Preview {
    AddItemView()
}