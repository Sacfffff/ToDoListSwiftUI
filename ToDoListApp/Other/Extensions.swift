//
//  Extensions.swift
//  ToDoListApp
//
//  Created by Aleks Kravtsova on 7.05.23.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String: Any] {
        
        var result : [String: Any]  = [:]
        
        guard let data = try? JSONEncoder().encode(self) else { return result }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            result = json ??  [:]
        } catch {
            result =  [:]
        }
        
        return result
    }
    
}
