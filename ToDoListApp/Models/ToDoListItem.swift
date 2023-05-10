//
//  ToDoListItem.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import Foundation

struct ToDoListModel : Codable, Identifiable {
    
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
}
