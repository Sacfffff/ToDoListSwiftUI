//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject private var viewModel : ToDoListViewViewModel
    @FirestoreQuery private var items : [ToDoListItem]
    
    init(userId: String) {
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId)) 
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.delete(itemId: item.id)
                            } label: {
                                Text("Delete")
                            }

                        }
                }
                .listStyle(PlainListStyle())
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
