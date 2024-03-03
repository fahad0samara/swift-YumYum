//
//  FavoritesViewModel.swift
//  YumYum
//
//  Created by fahad samara on 3/2/24.


import Foundation

// Model representing an item in the favorites list
struct FavoriteItem {
    let foodItem: FoodItem
    var quantity: Int
}

class FavoritesViewModel: ObservableObject {
    @Published var favoriteItems: [FavoriteItem] = []


    func addToFavorites(_ foodItem: FoodItem) {
        if favoriteItems.firstIndex(where: { $0.foodItem.name == foodItem.name }) != nil {
            // Item already exists, do nothing
        } else {
            favoriteItems.append(FavoriteItem(foodItem: foodItem, quantity: 1))
        }
    }




    // Remove an item from favorites
    func removeFromFavorites(_ foodItem: FoodItem) {
        if let index = favoriteItems.firstIndex(where: { $0.foodItem.id == foodItem.id }) {
            favoriteItems[index].quantity -= 1
            if favoriteItems[index].quantity <= 0 {
                favoriteItems.remove(at: index)
            }
        }
    }

    // Get the count of favorite items
    func favoriteItemsCount() -> Int {
        return favoriteItems.count
    }
    
    func deleteAllFavorites() {
        favoriteItems.removeAll()
    }

}


