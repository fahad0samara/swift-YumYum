//
//  FoodViewModel.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import Foundation
import SwiftUI

class FoodViewModel: ObservableObject {
    @Published var foodItems: [FoodItem] = []
    var categories: [String] {
        Set(foodItems.map { $0.category }).sorted()
    }

    init() {
        loadFoodItems()
    }
    
    func loadFoodItems() {
        if let fileURL = Bundle.main.url(forResource: "food_data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                self.foodItems = try decoder.decode([FoodItem].self, from: data)
            } catch {
                print("Error loading food items: \(error.localizedDescription)")
            }
        }
    }
}

