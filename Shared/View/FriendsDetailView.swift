//
//  FriendsDetailView.swift
//  FriendFace-SwiftUI
//
//  Created by Robert Pinl on 01.06.2021.
//

import SwiftUI

struct FriendsDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var usersData: UsersData
    
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "x.circle")
                        .font(.title)
                        .foregroundColor(.accentColor)
                        .padding()
                })
                Spacer()
            }
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
            Spacer()
        }
    }
}

struct FriendsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsDetailView(usersData: UsersData(), user: User(id: "", isActive: false, name: "Alford Rodriguez", age: 20, company: "Apple", email: "x@y", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt.\r\n", registered: "2015-11-10T01:47:18-00:00", tags: ["cillum",
                                                                                                                                                                                                                                                                                                                                                                                             "consequat",
                                                                                                                                                                                                                                                                                                                                                                                             "deserunt",
                                                                                                                                                                                                                                                                                                                                                                                             "nostrud",
                                                                                                                                                                                                                                                                                                                                                                                             "eiusmod",
                                                                                                                                                                                                                                                                                                                                                                                             "minim",
                                                                                                                                                                                                                                                                                                                                                                                             "tempor"], friends: [Friend(id: "1", name: "Hawkins Patel"), Friend(id: "2", name: "Jewel Sexton"), Friend(id: "1", name: "Hawkins Patel")]))
    }
}
