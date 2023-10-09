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
                    LoginScreen(onLogin: { sessionId in
                        UserDefaults.standard.set(sessionId, forKey: "sessionId")
                        self.isLoggedIn = true
                    })
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
