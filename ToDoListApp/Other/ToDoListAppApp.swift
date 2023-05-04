//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    
    init() {
        
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
