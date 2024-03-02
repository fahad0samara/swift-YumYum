//
//  FavoritesViewModel.swift
//  YumYum
//
//  Created by fahad samara on 3/2/24.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favoriteItems: [FoodItem] = []

    // Add an item to favorites
    func addToFavorites(_ foodItem: FoodItem) {
        if !favoriteItems.contains(where: { $0.id == foodItem.id }) {
            favoriteItems.append(foodItem)
        }
    }

    // Remove an item from favorites
    func removeFromFavorites(_ foodItem: FoodItem) {
        favoriteItems.removeAll(where: { $0.id == foodItem.id })
    }
    
    // Get the count of favorite items
    func favoriteItemsCount() -> Int {
        return favoriteItems.count
    }
}

