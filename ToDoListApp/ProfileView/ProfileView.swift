//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
