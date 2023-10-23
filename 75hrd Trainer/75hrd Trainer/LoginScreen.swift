//
//  LoginScreen.swift
//  75hrd Trainer
//
//  Created by Tanishq Patidar on 09/10/23.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    var onLogin: (String) -> Void
    @State private var sessionId: String = ""
    @State private var loginStatus: String = ""
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 22) {
                ZStack{
                    Rectangle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(red: 0.64, green: 1, blue: 0))
                    
                    Image("brandLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 110)
                        .clipped()
                }
                Text("Log in")
                    .font(
                        Font.system(size: 24)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
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
                    AuthenticationManager.shared.signIn(email: email, password: password) { result in
                        switch result {
                        case .success(let user):
                            self.onLogin(user.uid ?? "")
                            print("User signed up with UID: \(user.uid ?? "")")
                            self.loginStatus = "user logged in successfully"
                        case .failure(let error):
                            print("Error signing up: \(error.localizedDescription)")
                            self.loginStatus = "there was an error logging in"
                        }
                    }
                }, label: {
                    Text("Log in")
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
                NavigationLink(destination: SignupScreen().navigationBarHidden(true), label: {
                    Text("Sign up")
                        .frame(maxWidth: .infinity)       .padding()
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 1))
                        .padding(.horizontal)
                }).navigationBarHidden(true)
            }
        }
    }
}

