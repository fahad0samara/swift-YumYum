//
//  CoreDataViewModel.swift
//  YumYum
//
//  Created by fahad samara on 3/2/24.
//


//

import Foundation
import CoreData

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var foodItems: [FoodEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FoodItem")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
        fetchFoodItems()
    }
    
    private func fetchFoodItems() {
        let request: NSFetchRequest<FoodEntity> = FoodEntity.fetchRequest()
        
        do {
            foodItems = try container.viewContext.fetch(request)
            print("Fetched food items: \(foodItems)")
        } catch {
            print("Error fetching food items: \(error)")
        }
    }

    func save() {
        let context = container.viewContext
        do {
            try context.save()
            print("Data saved")
            fetchFoodItems()
        } catch {
            print("Unable to save data: \(error)")
        }
    }
    
    func addFood(name: String) {
        let context = container.viewContext
        let food = FoodEntity(context: context)
        food.id = UUID()
        food.name = name
        
        save()
    }
}

