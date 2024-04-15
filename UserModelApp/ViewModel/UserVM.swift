//
//  UserVM.swift
//  UserModelApp
//
//  Created by Berkay Emre Aslan on 15.04.2024.
//

import Foundation

class UserListVM: ObservableObject {
    
    @Published var userList = [UserVM]()
   
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        
        var resource = ""
        
        if service.type == "Webservice" {
            resource = Constants.Urls.usersExtension
        }else{
            resource = Constants.Paths.baseUrl
        }
        
        do {
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserVM.init)
            }
        }catch{
            print("Error")
        }
    }
}


struct UserVM {
    
    let user: User
    
    var id : Int {
        user.id
    }
    var name : String {
        user.name
    }
    var username : String {
        user.username
    }
    var email : String {
        user.email
    }
    
}
