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
    var body: some View {
        ZStack(alignment: .center) {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 40) {
                Image("brandLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 154, height: 100.0609130859375)
                    .clipped()
                
                TextField("Email", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                
                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black, lineWidth: 1)
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
                        .foregroundColor(.white)
                        .background(.blue)
                    
                        .clipShape(Capsule())
                        .padding(.horizontal)
                })
            }
            .padding()
        }
    }
}

struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}
