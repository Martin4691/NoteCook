//
//  Profile.swift
//  NoteCook
//
//  Created by Martín on 14/01/2021.
//

import Foundation
import UIKit

struct ProfileModel: Equatable, Codable {
    static var name: String?
    static var imageName: String?
    static var image: UIImage? {
        return UIImage(named: imageName ?? "LogoPNGTenoch")
    }
    
    
    
}



//El objetivo es que cada botón se asocie a un número en la array, asi cada perfil (id) tendra este número como su identificador.



