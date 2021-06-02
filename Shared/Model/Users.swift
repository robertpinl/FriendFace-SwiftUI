//
//  Users.swift
//  FriendFace-SwiftUI
//
//  Created by Robert Pinl on 30.05.2021.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable, Identifiable {
    let id: String
    let name: String
}

typealias Users = [User]

