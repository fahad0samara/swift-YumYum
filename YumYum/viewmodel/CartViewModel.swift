//
//  CartViewModel.swift
//  YumYum
//
//  Created by fahad samara on 3/2/24.
//



import Foundation
import CoreData


// View model to manage the cart state
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
    
    // Calculate the total price of items in the cart including tax
    var totalPriceWithTax: Double {
        subtotalPrice + taxAmount
    }
    
    // Calculate the tax amount
    var taxAmount: Double {
        subtotalPrice * 0.10 // Assuming a fixed tax rate of 10%
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
}





