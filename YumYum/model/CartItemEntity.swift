//
//  File.swift
//  YumYum
//
//  Created by fahad samara on 3/2/24.
//



import Foundation
import CoreData

class CartItemEntity: NSManagedObject {
    @NSManaged var foodItemName: String
    @NSManaged var quantity: Int
}
