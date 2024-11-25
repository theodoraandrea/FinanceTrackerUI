//
//  Helper.swift
//  testui
//
//  Created by Theodora Andrea on 25/11/24.
//

import Foundation

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
