//
//  TabViewNav.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

struct TabViewNav: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel // Add FavoritesViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
                .badge(cartViewModel.cartItemsCount)

            FavoritView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
                }
                .badge(favoritesViewModel.favoriteItemsCount()) 
        }
        .accentColor(.orange)
    }
}



#Preview {
    TabViewNav()
}
