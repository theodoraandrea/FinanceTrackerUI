//
//  AddTransaction.swift
//  testui
//
//  Created by Theodora Andrea on 21/11/24.
//

import SwiftUI



struct AddTransaction: View {
        
    @State var amount:String = "0"
    @State var title:String = ""
    @State var isExpense:Bool = false
    @State var date:Date = Date()
    @State var category:String = ""
    
    @State var showKeypad:Bool = false
    
    enum Category: String, CaseIterable, Identifiable {
        case Food, Education, Entertainment, Other
        var id: Self {self}
    }
    
     
    var body: some View {
        VStack {
            if !showKeypad {
                Text("New entry")
                    .font(.system(size: 50))
                    .fontWeight(.thin)
            }
            
            ZStack {
                Capsule()
                    .frame(width: .infinity, height: 100)
                    .foregroundColor(.gray.opacity(0.1))
                    .padding(.horizontal, 10)
             
                Text(amount)
                    .font(.system(size:50))
                    .padding(.horizontal, 25)
                
            }
            .onTapGesture {
                showKeypad.toggle()
            }
            
            
            if showKeypad {
                NumberPad(amount:$amount, showKeypad: $showKeypad)
                    .onChange(of: amount) {
                        amount = formatBalance(value: amount)
                    }
            } else {
                VStack(spacing: 20) {
                    HStack {
                        ZStack{
                            Capsule()
                                .fill(isExpense ? .white : .accent)
                                .stroke(isExpense ? Color.black.opacity(0.4) : .accent, lineWidth: 1)
                                .frame(width: 150, height: 40)
                                .onTapGesture {
                                    if (isExpense) {
                                        isExpense.toggle()
                                    }
                                }
                            Text("Income")
                                .foregroundStyle(isExpense ? Color.black : .white)
                        }
                        
                        ZStack{
                            Capsule()
                                .fill(isExpense ? .accent : .white)
                                .stroke(isExpense ? .accent : Color.black.opacity(0.4), lineWidth: 1)
                                .frame(width: 150, height: 40)
                                .onTapGesture {
                                    if (!isExpense) {
                                        isExpense.toggle()
                                    }
                                }
                            Text("Expense")
                                .foregroundStyle(isExpense ? .white : Color.black)
                        }
                    }
                    
                    TextFieldWithUnderlineStyle(title: "", placeholder: "Description", textBinding: $title, required: false)
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $category) {
                            ForEach(Category.allCases) {
                                cat in
                                Text(cat.rawValue)
                            }
                        }.pickerStyle(.menu)
                    }
                    
                    Button(action: {}) {
                        Text("Save")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 1.25)
                    .background(.accent)
                    .cornerRadius(15)
                    
                }
                .padding(.horizontal, 20)
            }
            
            


        }
        .padding()
        
    }
}

#Preview {
    AddTransaction()
}
