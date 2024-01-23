//
//  GameRow.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/23/24.
//

import Foundation
import SwiftUI

struct GameRow: View {
    
    var item : LootItem
    
    var body: some View {
        HStack{
            if let imageCoverName = item.game.coverName, let imageCover = UIImage(named: imageCoverName)
            {
                Image(uiImage: imageCover)
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(height: 58)
                    .cornerRadius(4)
            } else {
                Image(systemName: "rectangle.slash")
                    .font(.system(size: 15))
                    .frame(height: 58)
                    .padding() .background(.gray.gradient.opacity(0.4)).cornerRadius(4)
            }
            Text(item.game.name)
        }
    }
}
