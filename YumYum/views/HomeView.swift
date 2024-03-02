import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = FoodViewModel()
    @State private var selectedCategory: String = "Burgers"
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Filter by Category")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.categories, id: \.self) { category in
                            CategoryButton(category: category, isSelected: category == selectedCategory)
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Text("Featured Recipes")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Featured recipes list
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(filteredFoodItems) { foodItem in
                        FeaturedRecipeCard(foodItem: foodItem,
                                           addToCartAction: { cartViewModel.addItem(foodItem) },
                                           addToFavoritesAction: { favoritesViewModel.addToFavorites(foodItem) })
                    
                
                        
                                
                        




                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
        .navigationBarTitle("Home")
        .onAppear {
            viewModel.loadFoodItems()
        }
    }
    
    private var filteredFoodItems: [FoodItem] {
        viewModel.foodItems.filter { $0.category == selectedCategory }
    }
}



struct FeaturedRecipeCard: View {
    let foodItem: FoodItem
    let addToCartAction: () -> Void
    let addToFavoritesAction: () -> Void


    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topTrailing) {
                Image(foodItem.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Button(action: {
                    addToFavoritesAction()

                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.orange)
                        .clipShape(Circle())
                        .padding(5)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(foodItem.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
            
                
                HStack {
                    Text("$\(String(format: "%.2f", foodItem.price))")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    Button(action: {
                        addToCartAction() // Add to cart action
                    }) {
                        Image(systemName: "cart.fill")
                            .foregroundColor(.orange)
                            .font(.headline)
                    }
                }
            }
        }
        .frame(width: 150)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


