//
//  ContentView.swift
//  UserModelApp
//
//  Created by Berkay Emre Aslan on 15.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListVM : UserListVM
    
    init() {
        self.userListVM = UserListVM(service: Localservice())
    }
    
    
    var body: some View {
        List(userListVM.userList,id: \.id){ user in
            VStack{
                Text(user.name)
                    .font(.title3.bold())
                    .foregroundColor(.blue)
                    .frame(maxWidth:.infinity, alignment: .leading )
                Text(user.username)
                    .foregroundColor(.indigo)
                    .frame(maxWidth:.infinity, alignment: .leading )
                Text(user.email)
                    .foregroundColor(.black)
                    .frame(maxWidth:.infinity, alignment: .leading )
            }
        }.task {
            await userListVM.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
