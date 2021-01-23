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
        
        print("\n-------------\nComprobación del perfil: \n\(ProfileKitchenModel.selectedProfile?.imageName)\n\(ProfileKitchenModel.selectedProfile?.name)\n------------")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        imageButOut.setImage(UIImage(systemName: "sombrero pirata"), for: .normal)
        textFieldOut.text = "Kitchen name..."
        
    }
    
    
    @IBAction func imageButtonAct(_ sender: Any) {
        print("----- prueba contenido de \(ProfileKitchenModel.selectedProfile?.imageName) ")
        
        self.performSegue(withIdentifier: "goToImages", sender: self)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
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
        
        // esto debería ser algo así:            
        let refreshAlert = UIAlertController(title: "Are you sure?", message: "Profile will be deleted.", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction!) in
            
            // de aqui
            if let profile = ProfileKitchenModel.selectedProfile {
                self.profileManager.removeProfile(profile)
            }
            self.navigationController?.popViewController(animated: true)
            // hasta aqui es la parte que elimina. El resto es la estructura del alert.
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    
    func removePreferences() {
        imageButOut.setBackgroundImage(UIImage(systemName: "sombrero pirata"), for: .normal)
        textFieldOut.text = "Kitchen name..."
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        removePreferences()
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
