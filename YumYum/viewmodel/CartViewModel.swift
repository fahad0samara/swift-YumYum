//
//  CartViewModel.swift
//  YumYum
//
//  Created by fahad samara on 3/2/24.
//



import Foundation
import CoreData


class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    // Add an item to the cart
    func addItem(_ foodItem: FoodItem) {
        if let existingIndex = cartItems.firstIndex(where: { $0.foodItem.name == foodItem.name }) {
            cartItems[existingIndex].quantity += 1
        } else {
            cartItems.append(CartItem(foodItem: foodItem, quantity: 1))
        }
    }
    
    // Calculate the subtotal price of items in the cart
    var subtotalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.foodItem.price * Double($1.quantity)) }
    }
    
    // Retrieve the count of cart items
    var cartItemsCount: Int {
        cartItems.count
    }
    
    // Remove an item from the cart
    func removeItem(_ cartItem: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.foodItem.name == cartItem.foodItem.name }) {
            cartItems.remove(at: index)
        }
    }
    
    // Update the quantity of an item in the cart
    func updateQuantity(_ cartItem: CartItem, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.foodItem.name == cartItem.foodItem.name }) {
            cartItems[index].quantity = quantity
        }
    }
}




