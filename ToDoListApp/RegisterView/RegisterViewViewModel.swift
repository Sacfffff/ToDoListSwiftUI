//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class RegisterViewViewModel : ObservableObject {
    
    @Published var name : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    
    
    init() {}
    
    
    func register() {
        
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid, error == nil else { return }
            self?.insertUserRecord(with: userId)
        }
        
    }
    
    
    private func validate() -> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            //errorMessage = ""
            return false
        }
        
        
        guard email.contains("@") && email.contains(".") else {
            //errorMessage = "Please enter valid email."
            return false
        }
        
        
        guard password.count >= 6 else {
            //errorMessage = "Please enter valid email."
            return false
        }
        
        return true
        
    }
    
    
    private func insertUserRecord(with userId: String) {
        
        let user = User(id: userId, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .setData(user.asDictionary())
        
    }
    
}
