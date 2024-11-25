//
//  AddTransaction.swift
//  testui
//
//  Created by Theodora Andrea on 21/11/24.
//

import SwiftUI

struct AddTransaction: View {
    
    var body: some View {
        VStack {
            ZStack {
                Capsule()
                    .frame(width: .infinity, height: 100)
                    .foregroundColor(.gray.opacity(0.1))
                    .padding(.horizontal, 20)
                Text("205.000.000")
                    .font(.system(size:50))
            }

        }
    }
}

#Preview {
    AddTransaction()
}
