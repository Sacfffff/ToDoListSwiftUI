//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

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
        
        
        
    }
    
    
    
}
