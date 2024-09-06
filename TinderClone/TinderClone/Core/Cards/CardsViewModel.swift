//
//  CardsViewModel.swift
//  TinderClone
//
//  Created by Taro Altrichter on 04.09.24.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    
    @Published var cards = [Card]()
    @Published var swipeAction: SwipeAction?
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task {
            await fetchCards()
        }
    }
    
    func fetchCards() async {
        do {
            self.cards = try await service.fetchCards()
        } catch {
            print("Failed to fetch cards with error: \(error)")
        }
    }
    
    func removeCard(card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        print("Cards before removal: \(cards.count)")
        cards.remove(at: index)
        print("Cards after removal: \(cards.count)")
    }
}
