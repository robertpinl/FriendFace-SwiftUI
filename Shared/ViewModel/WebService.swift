//
//  WebService.swift
//  FriendFace-SwiftUI
//
//  Created by Robert Pinl on 30.05.2021.
//

import Foundation

struct WebService {
    
    func fetchUsers(completion: @escaping (Users) -> ()) {
        if let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error.debugDescription)
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let users = try decoder.decode(Users.self, from: data)
                        DispatchQueue.main.async {
                            completion(users)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
