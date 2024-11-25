//
//  ContentView.swift
//  testui
//
//  Created by Theodora Andrea on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SignIn()
    }
}





extension View {
    func cornerRadius(_ radius:CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius:radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
        byRoundingCorners: corners,
                                cornerRadii: CGSize(width:radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct signAccount: View {
    var image:ImageResource
    var width:CGFloat
    var height:CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: {}, label: {
            Image(image).renderingMode(.template)
                .resizable().scaledToFill()
                .frame(width: width, height: height)
                .overlay {
                    RoundedRectangle(cornerRadius: 30).stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.gray.opacity(0.3))
                }
        })
        .tint(.primary)
    }
}

#Preview {
    ContentView()
}
