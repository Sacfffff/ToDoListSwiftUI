//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 2.05.23.
//

import SwiftUI

struct HeaderView: View {
    
    private let title : String
    private let subtitle : String
    private let angle : Double
    private let backgroundColor : Color
    
    init(title: String, subtitle: String, angle: Double, backgroundColor: Color) {
        self.title = title
        self.subtitle = subtitle
        self.angle = angle
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(.degrees(angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, backgroundColor: .blue)
    }
}
