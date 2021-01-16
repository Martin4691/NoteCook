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
    var id: Int?
    var imageName: String?
    var image: UIImage? {
        return UIImage(named: imageName ?? "LogoPNGTenoch")
    }
    
    //Codigo de Cesc
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name && lhs.imageName == rhs.imageName
    }
    
}



//El objetivo es que cada botón se asocie a un número en la array, asi cada perfil (id) tendra este número como su identificador.



