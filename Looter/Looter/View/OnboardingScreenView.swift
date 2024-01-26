//
//  OnboardingScreenView.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/26/24.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    let starting : () -> Void
    
    @State private var selectedPage : Int = 0
    
    var body: some View {
        TabView(selection : $selectedPage){
            OnBoardingView(item: OnboardingItem(title: "Gerer ses loot", description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle.", sfSymbol: "gym.bag.fill", sfSymbolColor: Color.blue, buttonContent: "Suivant"), action: {
                selectedPage = 1
            }).tag(0)
            
            OnBoardingView(item: OnboardingItem(title: "Votre wishlist", description: "Créez une liste de souhaits pour garder une trace des articles que vousvoulez acquérir.", sfSymbol: "wand.and.stars.inverse", sfSymbolColor: Color.purple, buttonContent: "Suivant"),
                action: {
                selectedPage = 2
            }).tag(1)
            
            OnBoardingView(item: OnboardingItem(title: "En un coup d'oeil", description: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de vote appareil.", sfSymbol: "eye.circle", sfSymbolColor: Color.orange, buttonContent: "Commencer"),
                action: starting).tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)).animation(.easeOut(duration : 0.2), value: selectedPage).transition(.slide)
    }
}

#Preview {
    OnboardingScreenView(starting: {})
}
