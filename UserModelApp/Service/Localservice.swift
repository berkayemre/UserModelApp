//
//  Localservice.swift
//  UserModelApp
//
//  Created by Berkay Emre Aslan on 15.04.2024.
//

import Foundation

class Localservice : NetworkService {
    var type: String = "Localservice"
    
    func download(_ resource: String) async throws -> [User] {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource Not Found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        return try JSONDecoder().decode([User].self, from: data)
    }
}
