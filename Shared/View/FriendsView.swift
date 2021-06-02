//
//  FriendsView.swift
//  FriendFace-SwiftUI
//
//  Created by Robert Pinl on 31.05.2021.
//

import SwiftUI

struct FriendsView: View {
        
    @ObservedObject var usersData: UsersData
    @State private var showingDetail = false
    
    var user: User
    
    var body: some View {
        List(user.friends) { friend in
            Button(action: {
                showingDetail.toggle()
                print(usersData.getUser(friend: friend))
            }, label: {
                HStack {
                    Image("placeholder")
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .opacity(0.6)
                    Text(friend.name)
                }
            })
                        .sheet(isPresented: $showingDetail, content: {
                                FriendsDetailView(usersData: usersData, user: usersData.getUser(friend: friend)) })
        }
        .navigationTitle("Friends")
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(usersData: UsersData(), user: User(id: "", isActive: false, name: "Alford Rodriguez", age: 20, company: "Apple", email: "x@y", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "", registered: "2015-11-10T01:47:18-00:00", tags: ["cillum",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "consequat",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "deserunt",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "nostrud",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "eiusmod",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "minim",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "tempor"], friends: [Friend(id: "1", name: "Hawkins Patel"), Friend(id: "2", name: "Jewel Sexton")]))
    }
}
