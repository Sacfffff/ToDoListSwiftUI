//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn {
            ToDoListView()
        } else {
            LoginView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
