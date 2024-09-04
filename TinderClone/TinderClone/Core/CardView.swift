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
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(User.MOCK_USERS[0].profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: ScreenDimensions.cardWidth, height: ScreenDimensions.cardHeight)
                    .overlay {
                        ImageTappingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageURLs.count)
                    }
                
                ImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageURLs.count)
                
                SwipeActionIndicatorView(xOffset: $xOffset, screenCutoff: ScreenDimensions.screenCutoff)
            }
            
            UserInfoView(user: user)
        }
        .frame(width: ScreenDimensions.cardWidth, height: ScreenDimensions.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    xOffset = value.translation.width
                })
                .onEnded({ value in
                    if abs(xOffset) <= abs(ScreenDimensions.screenCutoff) {
                        toCenter()
                        return
                    }
                    
                    if xOffset >= ScreenDimensions.screenCutoff {
                        swipeRight()
                    } else {
                        swipeLeft()
                    }
                })
        )
    }
}

private extension CardView {
    func toCenter() {
        xOffset = 0
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
        }
    }
}

#Preview {
    CardView(user: User.MOCK_USERS[0])
}
