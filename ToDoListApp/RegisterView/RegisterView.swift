//
//  RegistrationView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            
            HeaderView(title: "Register", subtitle: "Start organazing todos", angle: -15, backgroundColor: .orange)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Adress", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textInputAutocapitalization(TextInputAutocapitalization(.none))
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                CustomButton(title: "Create account", titleColor: .white, backgroundColor: .green) {
                    viewModel.register()
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
