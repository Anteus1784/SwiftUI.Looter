//
//  AddItemView.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/19/24.
//

import Foundation
import SwiftUI

enum ActiveAlert{
    case name, type, game
}

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var inventory: Inventory
    
    @State var id : UUID? = nil
    @State var name : String = ""
    @State var quantity: Int = 0
    @State var itemType : ItemType = .unknown
    @State var rarity : Rarity = Rarity.common
    @State var game : Game = .emptyGame
    @State var attackStrength : Int = 0
    @State private var areTogglesOn: Bool = false
    
    @State private var showError = false
    @State private var activeAlert: ActiveAlert = ActiveAlert.name
    
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
                if areTogglesOn {
                    Stepper(value: $attackStrength,
                            in: 0...10,
                            step: 1) {
                        Text("Force d'attaque : \(attackStrength)")}
                }
                
            }
            
            
            Section {
                Button(action: {
                    
                    if name.count < 3 || name.isEmpty{
                        activeAlert = ActiveAlert.name
                        showError = true
                        return
                    }
                    if itemType == ItemType.unknown {
                        activeAlert = ActiveAlert.type
                        showError = true
                        return
                    }
                    if game == Game.emptyGame {
                        activeAlert = ActiveAlert.game
                        showError = true
                        return
                    }
                    
                    if (id == nil) {
                        let item = LootItem(
                            quantity:quantity,
                            name: name,
                            type: itemType,
                            rarity: rarity,
                            attackStrength: areTogglesOn ? attackStrength : nil,
                            game: game)
                        inventory.addItem(item: item)
                    }
                    else {
                        let item = LootItem(
                            id: id!,
                            quantity:quantity,
                            name: name,
                            type: itemType,
                            rarity: rarity,
                            attackStrength: areTogglesOn ? attackStrength : nil,
                            game: game)
                        if let row = inventory.loot.firstIndex(where: { $0.id == self.id}) {
                            inventory.loot[row] = item
                        }
                        
                    }
                    
                    dismiss()
                }, label: {
                    Text("Ajouter l'objet")
                }).alert(isPresented: $showError){
                    switch activeAlert {
                    case .name:
                        Alert(title: Text("Erreur avec le nom"), message: Text("Le nom doit être supérieur à trois caractère"))
                    case .type:
                        Alert(title: Text("Erreur avec le type"), message: Text("Le type ne doit pas être unknown"))
                    case .game:
                        Alert(title: Text("Erreur avec le jeu"), message: Text("Le jeu doit être rensigné"))
                    }
                }
            }
        }
    }
}

#Preview {
    AddItemView()
}
