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

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        imageButOut.layer.cornerRadius = 5
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let avatarImageName = ProfileEditionModel.image {
            imageButOut.setImage(UIImage(named: avatarImageName), for: .normal)
            imageButOut.setBackgroundImage(nil, for: .normal)
            
        } else {
            imageButOut.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        imageButOut.setImage(UIImage(systemName: "sombrero"), for: .normal)
        imageButOut.setBackgroundImage(nil, for: .normal)
        textFieldOut.text = "Kitchen name..."
        
    }
    
    
    @IBAction func imageButtonAct(_ sender: Any) {
        self.performSegue(withIdentifier: "goToImages", sender: self)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {

        guard let name = textFieldOut.text
        else { return }
        let profile: ProfileModel = ProfileModel(name: name, id: 0, imageName: ProfileEditionModel.image ?? "LogoPNGTenoch")
        
        if let selectedProfile = ProfileKitchenModel.selectedProfile {
            profileManager.removeProfile(selectedProfile)
        }
        profileManager.saveProfile(profile)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
}
