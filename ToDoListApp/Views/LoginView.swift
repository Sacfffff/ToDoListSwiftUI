//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel : LoginViewViewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, backgroundColor: .pink)
                
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(TextInputAutocapitalization(.none))
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    CustomButton(title: "Log in", titleColor: .white, backgroundColor: .blue) {
                        //action
                    }
                }
                .offset(y: -50)
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
