//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 1.05.23.
//

import Foundation

final class LoginViewViewModel : ObservableObject {
    
    @Published  var email : String = ""
    @Published  var password : String = ""
    
    init() {}
    
}
