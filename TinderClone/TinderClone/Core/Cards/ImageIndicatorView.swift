//
//  ImageIndicatorView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 01.09.24.
//

import SwiftUI

struct ImageIndicatorView: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    var imageIndicatorWidth: CGFloat {
        return (UIScreen.main.bounds.width - 20) / CGFloat(imageCount) - 28
    }
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id:\.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .gray)
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

#Preview {
    ImageIndicatorView(currentImageIndex: 1, imageCount: 5)
        .preferredColorScheme(.dark)
}
