//
//  SignupScreen.swift
//  75Hrd Trainer
//
//  Created by Tanishq Patidar on 25/09/23.
//

import SwiftUI
import Foundation

struct SignupScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isLoggedIn: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 22) {
                Rectangle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(red: 0.64, green: 1, blue: 0))
                    .overlay {
                        Image("brandLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170, height: 110)
                            .clipped()
                    }
                
                Text("Sign up")
                    .font(
                        Font.system(size: 24)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.top, 24)
                
                TextField("Email", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .foregroundColor(Color(red: 0.57, green: 0.6, blue: 0.64))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(red: 0.57, green: 0.6, blue: 0.64), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                
                SecureField("Password", text: $password)
                    .foregroundColor(Color(red: 0.57, green: 0.6, blue: 0.64))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(red: 0.57, green: 0.6, blue: 0.64), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                Button(action: {
                    AuthenticationManager.shared.signUp(email: email, password: password) { result in
                        switch result {
                        case .success(let user):
                            print("User signed up with UID: \(user.uid ?? "")")
                        case .failure(let error):
                            print("Error signing up: \(error.localizedDescription)")
                        }
                    }
                }, label: {
                    Text("Sign up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color(red: 0.64, green: 1, blue: 0))
                        .clipShape(Capsule())
                        .padding(.horizontal)
                })
                
                HStack {
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .foregroundColor(Color(red: 0.57, green: 0.6, blue: 0.64))
                    
                    Text("OR")
                        .foregroundColor(Color(red: 0.57, green: 0.6, blue: 0.64))
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .foregroundColor(Color(red: 0.57, green: 0.6, blue: 0.64))
                }
                NavigationLink(destination: LoginScreen(onLogin: { sessionId in
                    UserDefaults.standard.set(sessionId, forKey: "sessionId")
                    self.isLoggedIn = true
                }).navigationBarHidden(true), label: {
                    Text("Log in")
                        .frame(maxWidth: .infinity)       .padding()
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 1))
                        .padding(.horizontal)
                }).navigationBarHidden(true)
            }
            .padding()
        }
    }
}

#Preview {
    SignupScreen()
}
