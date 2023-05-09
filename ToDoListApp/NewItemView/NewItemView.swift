//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject private var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            
            Form {
                
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.top, .bottom], 4)
                
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                CustomButton(title: "Save", titleColor: .white, backgroundColor: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                  
                }
            }
            .padding(.top, -20)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date thay is today or newer."))
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: { return true }, set: { _ in }))
    }
}
