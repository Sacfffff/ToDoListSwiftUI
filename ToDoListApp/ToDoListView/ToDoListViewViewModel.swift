//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import Foundation

final class ToDoListViewViewModel : ObservableObject {
    
    @Published var showingNewItemView : Bool = false
    
    init() {}
    
}
