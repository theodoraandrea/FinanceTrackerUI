//
//  ForgotPassword.swift
//  testui
//
//  Created by Theodora Andrea on 21/11/24.
//

import SwiftUI

struct ForgotPassword: View {
    
    @State var email: String
    
    var body: some View {
        ZStack {    
            Color.accentColor.opacity(0.2)

            VStack(spacing: 20) {
                /*
                Rectangle().fill(Color.gray.opacity(0.4))
                    .frame(width: 40, height: 4)
                    .cornerRadius(4)
                 */
                
                Text("Forgot password?")
                    .font(.headline)
                    .padding(.top, 40)
                
                TextFieldWithUnderlineStyle(title: "Email", placeholder: "Enter your email", textBinding: $email, color: .black)
                
                Button(action: {}) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width / 1.25)
                .background(.black)
                .cornerRadius(15)
                .padding(.top, 30)
            }
            .padding(.horizontal, 30)
        }
        .foregroundColor(.black)
        .cornerRadius(40, corners: [.topLeft, .topRight])
        .frame(height: 320, alignment: .bottom)
    }
}

#Preview {
    ForgotPassword(email: "")
}
