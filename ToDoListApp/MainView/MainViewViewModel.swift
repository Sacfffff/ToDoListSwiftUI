//
//  MainViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import FirebaseAuth
import Foundation

final class MainViewViewModel : ObservableObject {
    
    @Published var currentUserId : String?
    
    private var handler : AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid
            }
        }
    }
    
    var isSignedIn : Bool {
        return currentUserId != nil
    }
    
}
