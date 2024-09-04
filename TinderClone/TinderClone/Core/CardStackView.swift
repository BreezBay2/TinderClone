//
//  CardStackView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 04.09.24.
//

import SwiftUI

struct CardStackView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ForEach(0 ... 3, id: \.self) { card in
                        CardView(user: User.MOCK_USERS[0])
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Tinder")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
