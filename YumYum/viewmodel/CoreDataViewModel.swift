import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container = NSPersistentContainer(name: "AppDataModel")
    
    @Published var foodItems: [FoodItem] = []
    @Published var cartItems: [CartItemEntity] = []
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
        fetchCartItems()
    }



    

    
    func fetchCartItems() {
        let request: NSFetchRequest<CartItemEntity> = CartItemEntity.fetchRequest()
        
        do {
            cartItems = try container.viewContext.fetch(request)
            print("Fetched cart items: \(cartItems)")
        } catch {
            print("Error fetching cart items: \(error)")
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
            
            fetchCartItems()
        } catch {
            print("Unable to save data")
        }
    }
    
    // Assuming you have a function to add an item to the cart in your CoreDataViewModel
    func addToCart(foodItem: FoodItem, quantity: Int, context: NSManagedObjectContext) {
        let cartItem = CartItemEntity(context: context)
        cartItem.id = UUID()
        cartItem.foodItemId = foodItem.id
        cartItem.foodItem = foodItem  // Set the relationship to the corresponding FoodItem entity
        cartItem.quantity = Int16(quantity)
        
        save(context: context)
    }


        func removeFromCart(cartItem: CartItemEntity) {
            container.viewContext.delete(cartItem)
            save(context: container.viewContext)
        }
}
