//
//  SwipeActionIndicatorView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 02.09.24.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    var body: some View {
        HStack {
            Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100, height: 50)
                }
                .rotationEffect(.degrees(-30))
            
            Spacer()
            
            Text("NOPE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 100, height: 50)
                }
                .rotationEffect(.degrees(30))
        }
        .padding(40)
    }
}

#Preview {
    SwipeActionIndicatorView()
}
