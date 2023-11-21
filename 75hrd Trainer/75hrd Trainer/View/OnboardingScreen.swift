//
//  OnboardingScreen.swift
//  75hrd Trainer
//
//  Created by Tanishq Patidar on 24/10/23.
//

import SwiftUI

struct OnboardingScreen: View {
    @State private var isLoggedIn: Bool = false
    var body: some View {
        
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 50) {
                    Spacer()
                    Rectangle()
                    .foregroundColor(Color(red: 0.64, green: 1, blue: 0))
                    .frame(width: 55, height: 55)
                    .overlay{
                        Image("brandLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 204, height: 132)
                            .clipped()
                    }
                    
                    Text("75Hrd Trainer")
                      .font(
                        Font.system(size: 32)
                          .weight(.heavy)
                      )
                      .foregroundColor(Color(red: 0.64, green: 1, blue: 0))
                    
                    Text("75Hrd not only tracks but guides you with personalized workouts and meal plans")
                      .font(
                        Font.system(size: 16)
                          .weight(.medium)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.57, green: 0.6, blue: 0.64))
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 35) {
                        NavigationLink(destination: SignupScreen(), label: {
                            HStack(alignment:.center) {
                                Text("Get started")
                                  .font(
                                    Font.system(size: 16)
                                      .weight(.semibold)
                                  )
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(.black)
                                  .padding()
                                
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 28)
                                    .overlay {
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.black)
                                    }
                                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 12))
                                
                            }.background(Color(red: 0.64, green: 1, blue: 0))
                                .cornerRadius(30)
                        })
                        
                        Text("or")
                          .font(
                            Font.system(size: 16)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.57, green: 0.6, blue: 0.64))
                        
                        NavigationLink(destination: LoginScreen(onLogin: { sessionId in
                                                    UserDefaults.standard.set(sessionId, forKey: "sessionId")
                                                    self.isLoggedIn = true
                                                }), label: {
                                                    Text("Login")
                                                      .font(
                                                        Font.custom("Poppins", size: 16)
                                                          .weight(.semibold)
                                                      )
                                                      .multilineTextAlignment(.center)
                                                      .foregroundColor(.white)
                                                      .frame(width: 48, height: 21, alignment: .top)
                                                })
                    }

                }
            }
        }
    }
}

#Preview {
    OnboardingScreen()
}
