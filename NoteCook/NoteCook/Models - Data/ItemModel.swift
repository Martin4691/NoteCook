//
//  Item.swift
//  NoteCook
//
//  Created by Martín on 27/1/21.
//

import Foundation
import UIKit

struct Item: Equatable, Codable {
    
    var name: String?
     var kgInKitchen: Int?
    // Your stock at the moment.
     var kgMinimum: Int?
    // Minimum quantity to work. ( > = red).
     var kgLimit: Int?
    // the quantity that you use to call your supplier. ( > = yellow).
    var supplier: String?
    static var type: [String] = ["Meat", "Fish", "Vegetable", "Fruit", "Dessert", "Equipment", "Other"]
    
    static var unitForMeasurement: [String] = ["L", "Kg", "g", "Box", "Bottle", "Pack", "Otehr"]
    
    

    
}








