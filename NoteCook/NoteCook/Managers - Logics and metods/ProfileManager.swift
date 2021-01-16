//
//  ProfileManager.swift
//  NoteCook
//
//  Created by Martín on 16/01/2021.
//

import Foundation
import UIKit


struct ProfileManager {
    
    func readProfiles() -> [ProfileModel] {
        if let encodedData = UserDefaults.standard.data(forKey: ProfileKeys.profilesList.rawValue) {
            do {
                let userList = try JSONDecoder().decode([ProfileModel].self, from: encodedData)
                return userList
                
            } catch {
                print("Unable to decode [ProfileModel] (\(error)")
            }
        }
        return []
    }
    
    
    func saveProfile(_ profile: ProfileModel) {
        removeProfile(profile)
        var userList = readProfiles()
        userList.append(profile)
        saveAllProfiles(userList)
    }
    
    func removeProfile(_ profile:ProfileModel) {
        var userList = readProfiles()
        userList.removeAll(where: {$0 == profile })
        saveAllProfiles(userList)
    }
    
    private func saveAllProfiles(_ profile: [ProfileModel]) {
        guard let encodedData = try? JSONEncoder().encode(profile) else { return }
        UserDefaults.standard.set(encodedData, forKey: ProfileKeys.profilesList.rawValue)
        UserDefaults.standard.synchronize()
    }
}



enum ProfileKeys: String {
    case profilesList
}

