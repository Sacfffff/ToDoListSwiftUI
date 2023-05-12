//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

final class ToDoListItemViewViewModel : ObservableObject {

    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        
        if let uid = Auth.auth().currentUser?.uid {
            
            var itemCopy = item
            itemCopy.setDone(!item.isDone)
            
            let db = Firestore.firestore()
            
                db.collection(FirestoreKeys.usersPath)
                .document(uid)
                .collection(FirestoreKeys.itemsPath)
                .document(item.id)
                .setData(itemCopy.asDictionary())
            
        }
        
        
    }
    
}
