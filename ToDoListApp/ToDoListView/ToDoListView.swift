//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject private var viewModel = ToDoListViewViewModel()
    
    private var userId : String = ""
    
    init(userId: String) {
    
        self.userId = userId
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
