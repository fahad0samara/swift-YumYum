import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = FoodViewModel()
    @State private var selectedCategory: String = "Burgers"
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @State var searchText:String = ""
    @State private var isSearchActive = false

    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10){
                            HStack(alignment: .center) {
                                Text(greetingText)
                                    .font(.title)
                                    .italic()
                                    .foregroundColor(.orange)
                                
                                Text("fahad")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                            }
                            Text("Explore a Variety of Tasty Options")
                                .font(.subheadline)
                                .foregroundColor(.orange)
                                .padding(.bottom, 10)
                        }
                        
                        
                        
                        Spacer()
                        
                        Image("fahad")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                    }
                }
                    
                    SearchBarView(searchText: $searchText, isSearchActive: $isSearchActive)



                
              
                VStack(alignment: .leading, spacing: 20) {
                    Text("Filter by Category")
                        .font(.subheadline)
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
                            NavigationLink(destination: FoodDetailsView(foodItem: foodItem)) {
                                
                                FeaturedRecipeCard(foodItem: foodItem,
                                                   addToCartAction: { cartViewModel.addItem(foodItem) },
                                                   addToFavoritesAction: { favoritesViewModel.addToFavorites(foodItem) })
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                        }
                    }
                  
                }
                .padding(.top, 20)
            }
            .navigationBarTitle("")
            .onAppear {
                viewModel.loadFoodItems()
            }
        }
    }
    private var filteredFoodItems: [FoodItem] {
        viewModel.foodItems.filter { $0.category == selectedCategory }
    }
    private var greetingText: String {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: Date())
            
            switch hour {
            case 6..<12:
                return "Good Morning"
            case 12..<18:
                return "Good Afternoon"
            default:
                return "Good Evening"
            }
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


