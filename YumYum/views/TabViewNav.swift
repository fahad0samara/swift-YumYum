//
//  TabViewNav.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

struct TabViewNav: View {
    @EnvironmentObject var cartViewModel:CartViewModel // Access CartViewModel from the environment
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            CartView().environmentObject(cartViewModel) // Inject the CartViewModel here

                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .badge(cartViewModel.cartItemsCount) 
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .accentColor(.orange)
    }
}



#Preview {
    TabViewNav()
}
