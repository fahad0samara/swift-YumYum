//
//  FeaturedRecipeCard.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

struct FeaturedRecipeCard: View {
    let foodItem: FoodItem
    let addToCartAction: () -> Void
    let addToFavoritesAction: () -> Void


    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topTrailing) {
                Image(foodItem.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Button(action: {
                    addToFavoritesAction()

                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.orange)
                        .clipShape(Circle())
                        .padding(5)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(foodItem.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
            
                
                HStack {
                    Text("$\(String(format: "%.2f", foodItem.price))")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    Button(action: {
                        addToCartAction() // Add to cart action
                    }) {
                        Image(systemName: "cart.fill")
                            .foregroundColor(.orange)
                            .font(.headline)
                    }
                }
            }
        }
        .frame(width: 150)
    }
}

