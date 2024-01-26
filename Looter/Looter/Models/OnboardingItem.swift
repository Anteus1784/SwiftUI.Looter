//
//  OnboardingItem.swift
//  Looter
//
//  Created by Antonio MICHEL on 1/26/24.
//

import Foundation
import SwiftUI

struct OnboardingItem: Identifiable {
    let id = UUID()
    let title : String?
    let description : String?
    let sfSymbol : String?
    let sfSymbolColor : Color?
    let buttonContent : String?
}

