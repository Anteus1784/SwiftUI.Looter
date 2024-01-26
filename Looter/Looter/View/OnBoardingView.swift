//
//  OnBoardingView.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/26/24.
//

import SwiftUI

struct OnBoardingView: View {
    
    var item : OnboardingItem
    
    var action : () -> Void
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(item.title ?? "")
                .font(.system(size: 45, weight: .bold))
                .multilineTextAlignment(.center)
                .padding()
            
            Image(systemName: item.sfSymbol ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .padding(40)
                .background(item.sfSymbolColor)
                .clipShape(Circle())
                
            Text(item.description ?? "")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {action()}, label: {Text(item.buttonContent ?? "")})
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 25)
                .padding(.vertical, 10)
                .background(item.sfSymbolColor)
                .clipShape(Capsule())
                .padding(.top, 50)
            
        }.padding(.bottom, 200)
    }
}

#Preview {
    OnBoardingView(item: OnboardingItem(title: "Test", description: "Ceci est un test", sfSymbol: "gym.bag.fill", sfSymbolColor: Color.blue, buttonContent: "Get Started"), action: {})
}
