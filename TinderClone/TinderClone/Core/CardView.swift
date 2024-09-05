//
//  CardView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 01.09.24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    
    @State private var xOffset: CGFloat = 0
    @State private var currentImageIndex = 0
    
    let card: Card
    
    var user: User {
        return card.user
    }
    
    var imageCount: Int {
        return user.profileImageURLs.count
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: ScreenDimensions.cardWidth, height: ScreenDimensions.cardHeight)
                    .overlay {
                        ImageTappingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                
                ImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
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
        } completion: {
            viewModel.removeCard(card: card)
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
        } completion: {
            viewModel.removeCard(card: card)
        }
    }
}

#Preview {
    CardView(viewModel: CardsViewModel(service: CardService()), card: Card(user: User.MOCK_USERS[0]))
}
