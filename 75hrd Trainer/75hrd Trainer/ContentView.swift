//
//  ContentView.swift
//  75hrd Trainer
//
//  Created by Tanishq Patidar on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    var body: some View {
        if isLoggedIn {
                    HomeScreen()
                } else {
                    OnboardingScreen()
                }
    }
}

#Preview {
    ContentView()
}
