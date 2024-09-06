//
//  CardStackView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 04.09.24.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                ZStack {
                    ForEach(viewModel.cards) { card in
                        CardView(viewModel: viewModel, card: card)
                    }
                }
                if !viewModel.cards.isEmpty {
                    SwipeButtonsView(viewModel: viewModel)
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
