//
//  User.swift
//  TinderClone
//
//  Created by Taro Altrichter on 01.09.24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageURLs: [String]
}

extension User {
    static let MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, fullname: "Max Muster", age: 30, profileImageURLs: ["picture", "picture2"]),
        .init(id: NSUUID().uuidString, fullname: "Bob", age: 30, profileImageURLs: ["picture3", "picture4", "picture5"]),
        .init(id: NSUUID().uuidString, fullname: "Kim Possible", age: 30, profileImageURLs: ["picture6", "picture7"]),
        .init(id: NSUUID().uuidString, fullname: "Mr Incredible", age: 30, profileImageURLs: ["picture8", "picture9", "picture10", "picture11"])
    ]
}
