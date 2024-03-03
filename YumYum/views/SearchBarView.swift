//
//  SearchBarView.swift
//  YumYum
//
//  Created by fahad samara on 3/3/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isSearchActive: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Discover Delicious Dishes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .italic()
            }
            
            NavigationLink(destination: SearchResultsView(searchText: searchText), isActive: $isSearchActive) {
                EmptyView()
            }
            
            TextField("", text: $searchText,
                      prompt: Text("Discover Tasty Delights")
                          .foregroundColor(.orange.opacity(0.8))
            )
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
                    .shadow(color: .gray, radius: 3, x: 1, y: 1)
            )
            .onChange(of: searchText) { newValue in
                // Activate the search screen when the search text contains at least three characters
                isSearchActive = searchText.count >= 2
            }
            .accentColor(.orange)
            .foregroundColor(.white)
            .font(.body)
            .padding(.horizontal, 20)
        }
        .onAppear {
            // Clear the search text when the search screen is displayed
            searchText = ""
        }
    }
}



