//
//  CardService.swift
//  TinderClone
//
//  Created by Taro Altrichter on 04.09.24.
//

import Foundation

struct CardService {
    func fetchCards() async throws -> [Card]{
        let users = User.MOCK_USERS
        
        return users.map({ Card(user: $0) })
    }
}
