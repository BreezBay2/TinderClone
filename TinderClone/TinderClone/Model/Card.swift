//
//  Card.swift
//  TinderClone
//
//  Created by Taro Altrichter on 04.09.24.
//

import Foundation

struct Card: Identifiable, Hashable {
    
    let user: User
    
    var id: String { return user.id }
}
