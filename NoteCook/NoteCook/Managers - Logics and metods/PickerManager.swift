//
//  PickerManager.swift
//  NoteCook
//
//  Created by Martín on 17/01/2021.
//

import Foundation
import UIKit


struct PickerManager {
    
    let profileManager: ProfileManager = ProfileManager()
    func nameForPicker() {
        for nameProfile in profileManager.readProfiles().enumerated() {
        ArrayKitchensNames.kitchensNames.append(nameProfile.element.name)
    }
}


}



