//
//  _5hrd_TrainerApp.swift
//  75hrd Trainer
//
//  Created by Tanishq Patidar on 25/09/23.
//

import SwiftUI
import Firebase

@main
struct _5hrd_TrainerApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    if let sessionId = UserDefaults.standard.string(forKey: "sessionId") {
                        print("User is logged in with session ID: \(sessionId)")
                    } else {
                        print("User is not logged in")
                    }
                }
        }
    }
}
