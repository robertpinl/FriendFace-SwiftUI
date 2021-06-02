//
//  ContentView.swift
//  Shared
//
//  Created by Robert Pinl on 29.05.2021.
// https://www.hackingwithswift.com/guide/ios-swiftui/5/3/challenge

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var usersData = UsersData()
    
    let webService = WebService()
    
    var body: some View {
        NavigationView {
            List(usersData.users) { user in
                NavigationLink(destination: DetailView(usersData: usersData, user: user) ) {
                    HStack(spacing: 15) {
                        Image("placeholder")
                            .resizable()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .opacity(0.6)
                        VStack(alignment: .leading) {
                            HStack {
                                Text(user.name)
                                    .font(.headline)
                                Circle()
                                    .fill(user.isActive ? Color.green : Color.red)
                                    .frame(width: 10, height: 10)
                            }
                            Text(user.company)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }
            }
            .navigationTitle("Friend Face")
            .onAppear {
                webService.fetchUsers { users in
                    self.usersData.users = users
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
