//
//  CustomButton.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 4.05.23.
//

import SwiftUI

struct CustomButton: View {
    
    private let title : String
    private let titleColor : Color
    private let backgroundColor : Color
    private let action : () -> Void
    
    init(title: String, titleColor: Color, backgroundColor: Color, action: @escaping () -> Void) {
        
        self.title = title
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.action = action
        
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(titleColor)
                    .bold()
            }
        }
        .padding()
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Title", titleColor: .white, backgroundColor: .blue) {
            
        }
    }
}
