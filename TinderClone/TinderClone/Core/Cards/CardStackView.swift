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
            VStack {
                ZStack {
                    ForEach(viewModel.cards) { card in
                        CardView(viewModel: viewModel, card: card)
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
