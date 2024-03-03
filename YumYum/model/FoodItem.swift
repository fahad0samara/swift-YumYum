//
//  FoodItem.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import Foundation


struct FoodItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let calories: Int
    let category: String
    let ingredients: [String] 
    let imageName: String
}


