//
//  ProfileViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

final class ProfileViewViewModel : ObservableObject {
    
    @Published var user : User? = nil
    init() {}
    
    func fetchUser() {
        
        guard let uuid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection(FirestoreKeys.usersPath)
            .document(uuid)
            .getDocument { [weak self] snapshot, error in
                if let data = snapshot?.data(), error == nil  {
                    DispatchQueue.main.async {
                        self?.user = User(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", email: data["email"] as? String ?? "", joined: data["joined"] as? TimeInterval ?? 0)
                    }
                }
            }
        
    }
    
    func logOut() {
        
        do {
           
            try Auth.auth().signOut()
            
        } catch {
            
            print(error)
        }
        
    }
    
}
