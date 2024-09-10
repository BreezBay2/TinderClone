//
//  MainTabView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 01.09.24.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            CardStackView()
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
            
            CurrentUserProfileView(user: User.MOCK_USERS[3])
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
