//
//  User.swift
//  TinderClone
//
//  Created by Taro Altrichter on 01.09.24.
//

import Foundation

struct User: Identifiable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageURLs: [String]
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, fullname: "Max Muster", age: 30, profileImageURLs: ["picture", "picture2"])
    ]
}
