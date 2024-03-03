//
//  SearchResultsView.swift
//  YumYum
//
//  Created by fahad samara on 3/3/24.
//



import SwiftUI

struct SearchResultsView: View {
    var searchText: String
    @ObservedObject var viewModel = FoodViewModel()
    
    var body: some View {
        VStack {
            if filteredFoodItems.isEmpty {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Text("No results found for")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(searchText)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding()
                }
            } else {
              
                
                ScrollView {
                    LazyVStack {
                        ForEach(filteredFoodItems) { foodItem in
                            NavigationLink(destination: FoodDetailsView(foodItem: foodItem)) {
                                HStack {
                                    Image(foodItem.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(foodItem.name)
                                            .font(.headline)
                                        
                                        Text("$\(String(format: "%.2f", foodItem.price))")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.leading, 10)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 10)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Search Results")
        .onAppear {
            viewModel.loadFoodItems()
        }
    }
    
    private var filteredFoodItems: [FoodItem] {
        viewModel.foodItems.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
}




