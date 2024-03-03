//
//  FavoritesView.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            if cartViewModel.cartItems.isEmpty {
                Text("No items in the cart.")
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                List(cartViewModel.cartItems, id: \.foodItem.name) { cartItem in
                    HStack(spacing: 10) {
                        Image(cartItem.foodItem.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(cartItem.foodItem.name)
                                .font(.headline)
                            Text("Quantity: \(cartItem.quantity)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Action to remove item from cart
                            cartViewModel.removeItem(cartItem)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    Text("Subtotal: $\(String(format: "%.2f", cartViewModel.subtotalPrice))")
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    Spacer()
                }
                .padding(.vertical, 10)
                Button(action: {
                    // Action for checkout or payment
                }) {
                    Text("Checkout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding()
            }
            
     
        }
        .navigationBarTitle("Cart")
    }
}

