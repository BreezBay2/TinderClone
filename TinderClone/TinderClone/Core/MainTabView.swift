//
//  MainTabView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 01.09.24.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    
    var body: some View {
        TabView {
            CardView(user: user)
                .tabItem {
                    Image(systemName: "flame")
                }
                .tag(0)
            
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            Text("Messaging View")
                .tabItem {
                    Image(systemName: "bubble")
                }
                .tag(2)
            
            Text("Profile View")
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
