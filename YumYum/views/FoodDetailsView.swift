//
//  FoodDetailsView.swift
//  YumYum
//
//  Created by fahad samara on 3/3/24.
//

import SwiftUI

struct FoodDetailsView: View {
    let foodItem: FoodItem
    @EnvironmentObject var cartViewModel: CartViewModel
    
    @State private var addedToCart = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(foodItem.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()
            
            VStack(alignment: .center, spacing: 10) {
                Text(foodItem.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(foodItem.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                Divider()
                
                HStack {
                    Text("Price:")
                        .font(.headline)
                    Spacer()
                    Text("$\(String(format: "%.2f", foodItem.price))")
                        .font(.headline)
                        .foregroundColor(.orange)
                }
                
                HStack {
                    Text("Calories:")
                        .font(.headline)
                    Spacer()
                    Text("\(foodItem.calories)")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 1)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(foodItem.ingredients, id: \.self) { ingredient in
                                Text(" \(ingredient)").foregroundStyle(Color.orange)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.gray.opacity(0.2))
                                    )
                            }
                        }
                    }
                }
           


                
                if addedToCart {
                    Text("Added to Cart")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(15)
                } else {
                    Button(action: {
                        cartViewModel.addItem(foodItem)
                        addedToCart = true
                    }) {
                        Text("Add to Cart")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(15)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity) // Center text horizontally
            .cornerRadius(30)
            .shadow(radius: 20) // Add shadow to the container
            
            Spacer()
        }
   
        .navigationBarTitle(foodItem.name)
    }
}


