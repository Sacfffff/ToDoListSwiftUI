//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import FirebaseFirestore
import Foundation

final class ToDoListViewViewModel : ObservableObject {
    
    @Published var showingNewItemView : Bool = false
    private let userId : String
    
    init(userId: String) {
        
        self.userId = userId
        
    }
    
    
    func delete(itemId: String) {
        
        let db = Firestore.firestore()
        
        db.collection(FirestoreKeys.usersPath)
            .document(userId)
            .collection(FirestoreKeys.itemsPath)
            .document(itemId)
            .delete()
        
    }
    
    
    
}
