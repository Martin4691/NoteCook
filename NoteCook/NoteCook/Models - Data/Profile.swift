//
//  Profile.swift
//  NoteCook
//
//  Created by Martín on 14/01/2021.
//

import Foundation
import UIKit

struct Profile: Equatable, Codable {
    static var name: String?
    static var imageName: String?
    static var image: UIImage? {
        return UIImage(named: imageName ?? "LogoPNGTenoch")
    }
    
    
}

var profilesList: [String: Int] = ["kitchen1": 1, "kitchen2": 2, "kitchen3":3, "kitchen4":4]

//El objetivo es que cada botón se asocie a un número en la array, asi cada perfil (id) tendra este número como su identificador.



