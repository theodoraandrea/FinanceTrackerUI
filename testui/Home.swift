//
//  Home.swift
//  testui
//
//  Created by Theodora Andrea on 21/11/24.
//

import SwiftUI

struct Home: View {
    @State var showAddNew:Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Color.accentColor
                    HStack {
                        Text("Welcome, Andrea")
                        Spacer()
                        VStack (alignment: .trailing) {
                            Text("Balance")
                            Text("IDR 50.000.000")
                        }
                    }
                    .padding(20)
                    .padding(.top, 80)
                }
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Spacer()
            }.ignoresSafeArea()
                .zIndex(2)

            ScrollView {
                VStack (spacing: 20) {
                    HStack {
                        Image(systemName:"chevron.backward")
                            .font(.title2)
                        Text("November")
                            .font(.title)
                            .padding(.horizontal, 20)
                        Image(systemName:"chevron.right")
                            .font(.title2)
                    }
                    .padding([.top, .horizontal], 20)
                    
                    Spacer()
                        .frame(height: 300)
                    
                    
                    ListItem()
                    ListItem()
                    ListItem()
                    ListItem()
                    ListItem()
                    ListItem()
                    ListItem()
                }
            }
            .padding(.top, 70)
            .zIndex(1)
            VStack {
                Spacer()

                Button (action: {
                    showAddNew.toggle()
                }){
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .foregroundColor(.accent)
                        .fontWeight(.light)
                }.sheet(isPresented: $showAddNew) {
                    AddTransaction()
                        .presentationDetents([.fraction(0.8)])
                        .presentationDragIndicator(.visible)
                }
            }
            .zIndex(3)

        }
    }
}

#Preview {
    Home()
}
