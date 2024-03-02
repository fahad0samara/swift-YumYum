//
//  ProfileView.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI




struct FavoritView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        VStack {
            if favoritesViewModel.favoriteItems.isEmpty {
                Text("No Favorite Items")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(favoritesViewModel.favoriteItems, id: \.id) { favoriteItem in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Image(favoriteItem.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)

                                Text(favoriteItem.name)
                                    .font(.headline)

                                Spacer()

                                Button(action: {
                                    // Action to remove item from favorites
                                    favoritesViewModel.removeFromFavorites(favoriteItem)
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
        }
        .navigationBarTitle("Favorites")
    }
}






#Preview {
    FavoritView()
}
