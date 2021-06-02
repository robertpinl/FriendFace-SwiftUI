//
//  UsersData.swift
//  FriendFace-SwiftUI
//
//  Created by Robert Pinl on 31.05.2021.
//

import Foundation

class UsersData: ObservableObject {
    @Published var users = [User]()
    
    func getUser(friend: Friend) -> User {
        let user = users.first { $0.id == friend.id }
        return user ?? users[0]
    }
}
