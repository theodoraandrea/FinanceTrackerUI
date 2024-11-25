//
//  SignIn.swift
//  testui
//
//  Created by Theodora Andrea on 20/11/24.
//

import SwiftUI

struct SignIn: View {
    @State var emailOrUsername: String = ""
    @State var password: String = ""
    
    @State var showPassword = false
    
    @State var showForgotPassword: Bool = false
    @State var forgotPasswordEmail: String = ""
    
    @State var showSignUp: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.accent)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Welcome")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .fontWeight(.light)
                        .padding(.top, 140)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 25)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    SignInBody {
                        VStack {
                           TextFieldWithUnderlineStyle(title: "Email or username", placeholder: "Enter your email or username", textBinding: $emailOrUsername, required: false)
                            
                            VStack {
                                Text("Password")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack {
                                    TextField("Enter your password", text: $password)
                                        .opacity(showPassword ? 1 : 0)
                                    
                                    SecureField("Enter your password", text: $password)
                                        .opacity(showPassword ? 0 : 1)
                                }
                                .overlay(alignment: .trailing) {
                                    Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                        .padding(16)
                                        .foregroundStyle(showPassword ? .primary : .secondary)
                                        .onTapGesture {
                                            showPassword.toggle()
                                        }
                                }
                            
                                Divider()
                                
                            }.padding(.top, 20)
                           
                            
                            Button(action: {}) {
                                Text("Sign in")
                                    .foregroundColor(.white)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 1.25)
                            .background(.black)
                            .cornerRadius(15)
                            .padding(.top, 30)
                            
                            
                            HStack {
                                Spacer()
                                Button("Forgot password?") {
                                    showForgotPassword.toggle()
                                }.sheet(isPresented: $showForgotPassword) {
                                    ForgotPassword(email: forgotPasswordEmail)
                                        .presentationCornerRadius(40)
                                        .presentationDetents([.height(260)])
                                        .presentationBackground(.white)
                                        .presentationDragIndicator(.visible)
                                }
                
                            }.padding(.top, 10)
                                .padding(.horizontal, 10)


                            HStack {
                                Rectangle()
                                    .frame(height: 1.5)
                                    .foregroundStyle(.gray.opacity(0.3))
                                Text("or")
                                Rectangle()
                                    .frame(height: 1.5)
                                    .foregroundStyle(.gray.opacity(0.3))
                            }
                            
                            signAccount(image: .google,
                                        width: 32, height: 32,
                                        action: {})
                            .padding(.vertical, 30)
                            
                        }.padding(.horizontal, 30)
                            .padding(.top, 60)
                        
                        HStack {
                            Text("Don't have an account?")
                            Button(action: {
                                showSignUp.toggle()
                            }) {
                                Text("Sign up")
                            }
                            .navigationDestination(isPresented: $showSignUp) {
                                SignUp()
                            }
                        }
                        
                        if showForgotPassword {
                            ForgotPassword(email: forgotPasswordEmail)
                        }
                    }
                }
            }
        }
    }
}

struct SignInBody<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                content
            }
            .frame(height: UIScreen.main.bounds.height / 1.2)
            .background(Color.white)
            .cornerRadius(35, corners: [.topLeft, .topRight])
        }
    }
}

#Preview {
    SignIn()
}
