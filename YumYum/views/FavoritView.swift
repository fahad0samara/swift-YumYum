//
//  ProfileView.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//



import UIKit


import SwiftUI

struct FavoritView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        VStack {
            Text("Your Favorite Items")
                .font(.title)
                .padding(.top)
            
            if favoritesViewModel.favoriteItems.isEmpty {
                Text("No Favorite Items")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(favoritesViewModel.favoriteItems, id: \.foodItem.id) { favoriteItem in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Image(favoriteItem.foodItem.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)

                                Text(favoriteItem.foodItem.name)
                                    .font(.headline)

                                Spacer()

                                Button(action: {
                                    // Action to remove item from favorites
                                    favoritesViewModel.removeFromFavorites(favoriteItem.foodItem)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            if !favoritesViewModel.favoriteItems.isEmpty {
                VStack {
                    Button(action: {
                        // Action to share favorites
                        shareFavorites()
                    }) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share Favorites")
                        }
                        .padding()
                    }
                    Button(action: {
                        // Action to delete all favorites
                        favoritesViewModel.deleteAllFavorites()
                    }) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                            Text("Delete All Favorites")
                        }
                        .padding()
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Favorites")
    }
    
    private func shareFavorites() {
        let favoriteItems = favoritesViewModel.favoriteItems.map { $0.foodItem.name }.joined(separator: "\n")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        
        if let window = windowScene.windows.first {
            let activityViewController = UIActivityViewController(activityItems: [favoriteItems], applicationActivities: nil)
            window.rootViewController?.present(activityViewController, animated: true, completion: nil)
        }
    }
}







#Preview {
    FavoritView()
}
