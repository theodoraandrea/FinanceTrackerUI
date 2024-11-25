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
            ScrollView {
                VStack {
                    HStack {
                        Text("Welcome, Andrea")
                        Spacer()
                        VStack (alignment: .trailing) {
                            Text("Balance")
                            Text("IDR 50.000.000")
                        }
                    }
                    .padding(20)
                    
                    
                }
            }
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
                    Text("Hello :)")
                        .presentationDragIndicator(.visible)
                }
            }

        }
    }
}

#Preview {
    Home()
}
