//
//  Profile.swift
//  NoteCook
//
//  Created by Martín on 14/01/2021.
//

import Foundation
import UIKit

struct ProfileModel: Equatable, Codable {
    var name: String?
    var imageName: String?
    var image: UIImage? {
        return UIImage(named: imageName ?? "LogoPNGTenoch")
    }
    
}

