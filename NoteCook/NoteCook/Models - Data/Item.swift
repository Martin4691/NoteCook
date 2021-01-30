//
//  Item.swift
//  NoteCook
//
//  Created by Martín on 27/1/21.
//

import Foundation
import UIKit

struct Item {
    
    let name: String
    static var kgInKitchen: Int = 0
    // Your stock at the moment.
    static var kgMinimum: Int = 0
    // Minimum quantity to work. ( > = red).
    static var kgLimit: Int = 0
    // the quantity that you use to call your supplier. ( > = yellow).
    var supplier: String = "Supplier Name"
    let type: ItemType
    let unitForMeasurement: UnitMeasurement
    
    enum ItemType: CaseIterable {
        case meat, fish, vegetable, fruit, dessert, equipment, other
    }
    
    enum UnitMeasurement: CaseIterable {
        case L, Kg, g, Box, Bottle, Pack, Other
    }
    
    init(name: String, kgInKitchen: Int, kgMinimum: Int, kgLimit: Int, supplier: String, type: ItemType, unitForMeasurement: UnitMeasurement) {
        
        self.name = name
        Item.kgInKitchen = kgInKitchen
        Item.kgMinimum = kgMinimum
        Item.kgLimit = kgLimit
        self.supplier = supplier
        self.type = type
        self.unitForMeasurement = unitForMeasurement
        
    }
    
    
    
    
}









