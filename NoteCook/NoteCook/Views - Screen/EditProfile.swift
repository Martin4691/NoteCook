//
//  EditProfile.swift
//  NoteCook
//
//  Created by Martín on 03/01/2021.
//

import Foundation
import UIKit

class EditProfile: UIViewController {
    
    @IBOutlet weak var textFieldOut: UITextField!
    @IBOutlet weak var imageButOut: UIButton!
    

    var profileManager = ProfileManager()
    var emptyProfile: ProfileModel = ProfileModel(name: "Insert name here...", imageName: "sombrero pirata")
    
    
    // MARK: -Appear Cicle:
    override func viewDidLoad() {
        super.viewDidLoad()
        imageButOut.layer.cornerRadius = 5
        textFieldOut.layer.borderColor = UIColor.gray.cgColor
        textFieldOut.layer.borderWidth = 2
        
        ProfileKitchenModel.selectedProfile = emptyProfile
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        textFieldOut.text = ProfileKitchenModel.selectedProfile?.name
        imageButOut.setImage(UIImage(named: (ProfileKitchenModel.selectedProfile?.imageName)!), for: .normal)
        
        textFieldOut.setNeedsDisplay()
        imageButOut.setNeedsDisplay()
        
        print("-------------\n To see info of selected profile: \n\(ProfileKitchenModel.selectedProfile?.imageName)\n\(ProfileKitchenModel.selectedProfile?.name)\n------------")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        imageButOut.setImage(UIImage(systemName: "sombrero pirata"), for: .normal)
        textFieldOut.text = "Insert name here..."
        
        
    }
    
    // MARK: -Actions
    @IBAction func imageButtonAct(_ sender: Any) {
        print("----- To see the image selected: \(ProfileKitchenModel.selectedProfile?.imageName)\n---------- ")
        
        self.performSegue(withIdentifier: "goToImages", sender: self)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        // Save metod:
        guard let name = textFieldOut.text
        else { return }
        let profile: ProfileModel = ProfileModel(name: name, imageName: ProfileKitchenModel.selectedProfile?.imageName ?? "LogoPNGTenoch")
        
        if let selectedProfile = ProfileKitchenModel.selectedProfile {
            profileManager.removeProfile(selectedProfile)
        }
        profileManager.saveProfile(profile)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        // This button don't delete profiles, only the preferences selected for new profile.
        removePreferences()
        ProfileKitchenModel.selectedProfile = emptyProfile
        print("-------\n Pruebatras presionar delete button:\n\(ProfileKitchenModel.selectedProfile)")
    }
    
    func removePreferences() {
        imageButOut.setBackgroundImage(UIImage(systemName: "sombrero pirata"), for: .normal)
        textFieldOut.text = "Insert name here..."
        ProfileKitchenModel.selectedProfile?.imageName = "sombrero pirata"
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        removePreferences()
        ProfileKitchenModel.selectedProfile = emptyProfile
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
