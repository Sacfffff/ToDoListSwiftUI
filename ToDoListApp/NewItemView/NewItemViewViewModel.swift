//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import Firebase
import FirebaseFirestore
import Foundation

final class NewItemViewViewModel : ObservableObject {
    
    @Published var title : String = ""
    @Published var dueDate : Date = .now
    @Published var showAlert : Bool = false
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty,
              dueDate >= Date().addingTimeInterval(-86400) else { return false }
        
        return true
    }
    
    init() {}
    
    func save() {
        
        guard canSave, let uid = Auth.auth().currentUser?.uid else { return }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
         
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    
    
}
