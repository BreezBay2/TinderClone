//
//  CardView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 01.09.24.
//

import SwiftUI

struct CardView: View {
    let user: User
    
    @State private var xOffset: CGFloat = 0
    @State private var currentImageIndex = 0
    
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(User.MOCK_USERS[0].profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: cardWidth, height: cardHeight)
                    .overlay {
                        ImageTappingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageURLs.count)
                    }
                
                ImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageURLs.count)
                
                SwipeActionIndicatorView()
            }
            
            UserInfoView(user: user)
        }
        .frame(width: cardWidth, height: cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    xOffset = value.translation.width
                })
                .onEnded({ value in
                    xOffset = 0
                })
        )
    }
}

#Preview {
    CardView(user: User.MOCK_USERS[0])
}
