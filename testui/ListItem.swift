//
//  ListItem.swift
//  testui
//
//  Created by Theodora Andrea on 25/11/24.
//

import SwiftUI

struct ListItem: View {
    
    @State var category: String = "Other"
    @State var title: String = ""
    @State var amount: Double = 50000
    @State var isExpense: Bool = true
    
    
    var body: some View {
        ZStack {
            RoundedCorner(radius: 30)
                .stroke(Color.black.opacity(0.6), lineWidth: 0.8)
                .foregroundColor(.clear)
                .frame(width: .infinity, height: 100)
                .padding(.horizontal, 20)

            HStack {
                if (category == "Other") {
                    Text("💸")
                        .font(.system(size: 40))
                } else if (category == "Food") {
                    Text("🍔")
                        .font(.system(size: 40))
                } else if (category == "Entertainment") {
                    Text("🍿")
                        .font(.system(size: 40))
                } else if (category == "Education") {
                    Text("📚")
                        .font(.system(size: 40))
                }
                
                VStack(alignment: .leading) {
                    Text(category)
                        .foregroundStyle(Color.black)
                        .fontWeight(.medium)
                        .font(.system(size:20))
                    if (!title.isEmpty) {
                        Text(title)
                            .font(.system(size: 18))
                            .foregroundStyle(Color.black.opacity(0.8))
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .lineLimit(1)
                    }
                }
                Spacer()
                Text(isExpense ? "-" : "+")
                    .font(.title2)
                    .foregroundStyle(isExpense ? Color.black : Color.green)
                Text(amount.formatted())
                    .font(.title2)
                    .foregroundStyle(isExpense ? Color.black : Color.green)
            }
            .frame(width: .infinity, height: 100)
            .padding(.horizontal, 40)
        }
    }
}

struct ListItemTest: View {
    var body: some View {
        ScrollView {
            VStack {
                ListItem(category: "Other", title: "asdfjalsdkfj aldkfjald lkadjflaksdf ", amount: 100000000, isExpense: false)
                ListItem(category: "Food")
                ListItem(category: "Entertainment")
                ListItem(category: "Education")
            }
        }
    }
}

#Preview {
    ListItemTest()
}
