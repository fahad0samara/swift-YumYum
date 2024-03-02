//
//  FavoritesView.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

struct FavoritesView: View {
 
        @ObservedObject var cartViewModel: CartViewModel
            
            var body: some View {
                List {
                    ForEach(cartViewModel.cartItems, id: \.id) { item in
                        Text(item.name)
                    }
                }
                .navigationBarTitle("Cart")
            }
    }


