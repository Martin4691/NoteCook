//
//  Profile.swift
//  NoteCook
//
//  Created by Martín on 14/01/2021.
//

import Foundation
import UIKit

struct ProfileModel: Equatable, Codable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name && lhs.imageName == rhs.imageName
    }
    

    var name: String?
    var imageName: String?
    var image: UIImage? {
        return UIImage(named: imageName ?? "LogoPNGTenoch")
    }
    
    var itemList: [Item?] = []
    
    
    
    
}

