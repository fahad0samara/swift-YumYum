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

    // Add an item to favorites
      func addToFavorites(_ foodItem: FoodItem) -> Bool {
          if !favoriteItems.contains(where: { $0.id == foodItem.id }) {
              favoriteItems.append(foodItem)
              // Notify the view about the change
              objectWillChange.send()
              return true
          } else {
              // Item is already in favorites, handle this case (optional)
              print("Item is already in favorites")
              return false
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

