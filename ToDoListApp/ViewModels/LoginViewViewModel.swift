//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import Foundation
import FirebaseAuth

final class LoginViewViewModel : ObservableObject {
    
    @Published  var email : String = ""
    @Published  var password : String = ""
    @Published  var errorMessage : String?
    
    init() {}
    
    func login() {
        
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    
    private func validate() -> Bool {
        
        errorMessage = nil
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
        
    }
    
}
