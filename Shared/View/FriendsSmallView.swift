//
//  FriendsSmallView.swift
//  FriendFace-SwiftUI
//
//  Created by Robert Pinl on 01.06.2021.
//

import SwiftUI

struct FriendsSmallView: View {
    
    var friend: Friend
    
    var body: some View {
        VStack {
            Image("placeholder")
                .resizable()
                .frame(width: 50, height: 50)
                .opacity(0.6)
            Text(friend.name)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 10)
    }
}


struct FriendsSmallView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsSmallView(friend: Friend(id: "", name: "John Snow"))
    }
}
