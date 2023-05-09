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
            accountView
        } else {
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var accountView : some View {
        
        TabView {
            ToDoListView(userId: viewModel.currentUserId ?? "")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
