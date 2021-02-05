//
//  Item.swift
//  NoteCook
//
//  Created by Martín on 27/1/21.
//

import Foundation
import UIKit

struct Item: Codable {
    
    let name: String
    static var kgInKitchen: Int = 0
    // Your stock at the moment.
    static var kgMinimum: Int = 0
    // Minimum quantity to work. ( > = red).
    static var kgLimit: Int = 0
    // the quantity that you use to call your supplier. ( > = yellow).
    var supplier: String = "Supplier Name"
    static var type: [String] = ["Meat", "Fish", "Vegetable", "Fruit", "Dessert", "Equipment", "Other"]
    var typeSelected: String
    static var unitForMeasurement: [String] = ["L", "Kg", "g", "Box", "Bottle", "Pack", "Otehr"]
    var unitSelected: String
    

    
}








