//
//  SignUp.swift
//  testui
//
//  Created by Theodora Andrea on 21/11/24.
//

import SwiftUI

struct SignUp: View {
    
    @State var email:String = ""
    @State var username:String = ""
    @State var fullname:String = ""
    @State var balanceString:String = ""
    @State var password:String = ""
    @State var confirmPassword:String = ""
    
    @State var showPassword:Bool = false
    @State var showConfirmPassword:Bool = false
    
    @State var emailValid:Bool = true
    
    func formatBalance(value:String) -> String {
        var formattedString = ""
        
        let cleanedValue = value.replacingOccurrences(of: ".", with: "")
        let doubleValue:NSNumber = NSDecimalNumber(string:cleanedValue)
        
        if value.count < 4 { return value }

        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .decimal

        formattedString = currencyFormatter.string(from: doubleValue) ?? ""
        return formattedString
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    var body: some View {
        ScrollView {
            Text("Sign up")
                .font(.title)
                .padding(30)
            
            VStack(spacing: 25) {
                
                VStack (alignment: .leading) {
                    TextFieldWithUnderlineStyle(title: "Email", textBinding: $email)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textContentType(.emailAddress)
                        .onChange(of: email) {
                            if (isValidEmail(email: email)) {
                                print("Valid email \(email)")
                                emailValid = true
                            } else {
                                print("Invalid email \(email)")
                                emailValid = false
                            }
                        }
                    
                    if(!emailValid) {
                        Text("Please enter a valid email address.")
                            .font(.caption)
                            .foregroundStyle(Color.black.opacity(0.4))
                    }
                }

                TextFieldWithUnderlineStyle(title: "Name", textBinding: $fullname)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.words)
                    .textContentType(.name)
                
                TextFieldWithUnderlineStyle(title: "Username", textBinding: $username, required: false)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textContentType(.username)
                
                VStack {
                    Text("Balance")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    HStack {
                        Text("IDR")
                        TextField("", text: $balanceString)
                            .keyboardType(.numberPad)
                            .onKeyPress(keys: [.delete]) { key in
                                if (balanceString.count > 0) {
                                    balanceString.removeLast()
                                }
                                let formatted = formatBalance(value: balanceString)
                                balanceString = formatted

                                return .handled
                            }
                            .onKeyPress(characters: .decimalDigits) { key in
                                
                                balanceString.append(key.key.character)
                                let formatted = formatBalance(value: balanceString)
                                balanceString = formatted
                                
                                return .handled
                            }
                    }
                    
                    Divider()
                }
                
                VStack (spacing: 10) {
                    HStack {
                        Text("Password")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Text("*")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }

                    
                    ZStack (alignment: .leading){
                        TextField("", text: $password)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .opacity(showPassword ? 1 : 0)
                        
                        SecureField("", text: $password)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
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
                    Text("Password must contain at least 8 characters, 1 uppercase letter, and 1 special character")
                        .font(.caption)
                        .foregroundStyle(Color.black.opacity(0.4))
                }
                
                VStack (spacing: 10) {
                    HStack {
                        Text("Confirm password")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Text("*")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }

                    
                    ZStack (alignment: .leading){
                        TextField("", text: $confirmPassword)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .opacity(showConfirmPassword ? 1 : 0)
                        
                        SecureField("", text: $confirmPassword)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .opacity(showConfirmPassword ? 0 : 1)
                    }
                    .overlay(alignment: .trailing) {
                        Image(systemName: showConfirmPassword ? "eye.fill" : "eye.slash.fill")
                            .padding(16)
                            .foregroundStyle(showConfirmPassword ? .primary : .secondary)
                            .onTapGesture {
                                showConfirmPassword.toggle()
                            }
                    }
                    Divider()
                }

                Button(action: {}) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width / 1.25)
                .background(.black)
                .cornerRadius(15)
                
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    SignUp()
}
