//
//  LooterApp.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/19/24.
//

import SwiftUI

@main
struct LooterApp: App {
    
    @AppStorage("FirstTime") var isOnboardingDone: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingDone {
                ContentView(action: {isOnboardingDone = false})
            }
            else {
                OnboardingScreenView(starting:
                    {isOnboardingDone = true}
                )
            }
        }
    }
}
