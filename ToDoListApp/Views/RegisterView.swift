//
//  RegistrationView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var name : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    
    var body: some View {
        VStack {
            
            HeaderView(title: "Register", subtitle: "Start organazing todos", angle: -15, backgroundColor: .orange)
            
            Form {
                TextField("Full Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email Adress", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                CustomButton(title: "Create account", titleColor: .white, backgroundColor: .green) {
                    //action
                }
                
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
