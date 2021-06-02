//
//  DetailView.swift
//  FriendFace-SwiftUI
//
//  Created by Robert Pinl on 31.05.2021.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var usersData: UsersData
    @State private var showingDetail = false
    @State private var friendIndex = Int()

    
    var user: User
    
    var body: some View {
        ScrollView {
            VStack {
                Image("placeholder")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .opacity(0.7)
                HStack() {
                    Circle()
                        .fill(user.isActive ? Color.green : Color.red)
                        .frame(width: 10, height: 10)
                    Text(user.isActive ? "Online" : "Offline")
                }
                Text(user.name)
                    .font(.title)
                    .bold()
                    .padding(.top)
                HStack {
                    Text(user.company)
                    Circle()
                        .fill(Color.secondary)
                        .frame(width: 7, height: 7)
                    Text("\(user.age) yo")
                }
                Divider()
                VStack {
                    Text("Adress")
                        .font(.headline)
                    Text(user.address)
                        .multilineTextAlignment(.center)
                }
                .padding()
                Divider()
                VStack {
                    
                    Text("About")
                        .font(.headline)
                    Text(user.about)
                        .font(.subheadline)
                }
                .padding()
                
                //FriendsView
                if user.friends.count > 1 {
                    Divider()
                    Text("Friends")
                        .font(.headline)
                    HStack(alignment: .top) {
                        Button(action: {
                            friendIndex = 0
                            showingDetail = true
                        }, label: {
                            FriendsSmallView(friend: user.friends[0])
                        })
                        if user.friends.count > 2 {
                            Button(action: {
                                friendIndex = 1
                                showingDetail = true
                            }, label: {
                                FriendsSmallView(friend: user.friends[1])
                            })
                        }
                        if user.friends.count > 3 {
                            Button(action: {
                                friendIndex = 2
                                showingDetail = true
                            }, label: {
                                FriendsSmallView(friend: user.friends[2])
                            })
                        }
                    }
                    
                    .frame(height: 90, alignment: .center)
                }
                
            }
            NavigationLink("Show more friends", destination: FriendsView(usersData: usersData, user: user))
                .padding()
        }
        .sheet(isPresented: $showingDetail, content: {
                FriendsDetailView(usersData: usersData, user: usersData.getUser(friend: user.friends[friendIndex])) })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(usersData: UsersData(), user: User(id: "", isActive: false, name: "Alford Rodriguez", age: 20, company: "Apple", email: "x@y", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt.\r\n", registered: "2015-11-10T01:47:18-00:00", tags: ["cillum",
                                                                                                                                                                                                                                                                                                                                                                                      "consequat",
                                                                                                                                                                                                                                                                                                                                                                                      "deserunt",
                                                                                                                                                                                                                                                                                                                                                                                      "nostrud",
                                                                                                                                                                                                                                                                                                                                                                                      "eiusmod",
                                                                                                                                                                                                                                                                                                                                                                                      "minim",
                                                                                                                                                                                                                                                                                                                                                                                      "tempor"], friends: [Friend(id: "1", name: "Hawkins Patel"), Friend(id: "2", name: "Jewel Sexton"), Friend(id: "1", name: "Hawkins Patel")]))
    }
}
