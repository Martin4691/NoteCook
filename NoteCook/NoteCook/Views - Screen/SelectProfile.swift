//
//  SelectProfile.swift
//  NoteCook
//
//  Created by Martín on 16/01/2021.
//

import Foundation
import UIKit

class SelectProfile: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let profileManager: ProfileManager = ProfileManager()
    let pickerManager: PickerManager = PickerManager()
    let profileModel: ProfileModel = ProfileModel()
    
    
    //MARK: Outlets:
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var viewChooseOut: UIView!
    
    @IBOutlet weak var viewLoadProfileOut: UIView!
    @IBOutlet weak var viewDeleteProfileOut: UIView!
    
    @IBOutlet weak var viewLabelProfileOut: UIView!
    @IBOutlet weak var labelProfileNameOut: UILabel!
    
    @IBOutlet weak var buttonProfile: UIButton!
    
    @IBOutlet weak var ButtonNewProfile: UIButton!
    
    
    // Empty profile:
    var emptyProfile: ProfileModel = ProfileModel(name: "You should create/select a profile!", imageName: "sombrero")
    
    
    // MARK: Appear Cicle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        print("---------\n To see elements in readProfile().enumerated(): \n\(profileManager.readProfiles().enumerated())\n--------")
        print("--------\n To see elements in ArrayKitchensNames.kitchenNames: \n\(ArrayKitchensNames.kitchensNames)\n-------")
        
        // Screen Layout:
        viewChooseOut.layer.cornerRadius = 20
        viewChooseOut.layer.borderWidth = 3
        viewChooseOut.layer.borderColor = UIColor.brown.cgColor
        
        pickerView.layer.cornerRadius = 30
        pickerView.layer.borderWidth = 5
        pickerView.layer.borderColor = UIColor.black.cgColor
        
        viewLoadProfileOut.layer.cornerRadius = 15
        viewLoadProfileOut.layer.borderColor = UIColor.brown.cgColor
        viewLoadProfileOut.layer.borderWidth = 3
        
        viewDeleteProfileOut.layer.cornerRadius = 5
        viewDeleteProfileOut.layer.borderColor = UIColor.black.cgColor
        viewDeleteProfileOut.layer.borderWidth = 3
        
        viewLabelProfileOut.layer.cornerRadius = 10
        viewLabelProfileOut.layer.borderWidth = 3
        viewLabelProfileOut.layer.borderColor = UIColor.brown.cgColor
        
        ButtonNewProfile.layer.borderColor = UIColor.black.cgColor
        ButtonNewProfile.layer.borderWidth = 3
        // Layout end.
        
        // First, the profile selected is an empty profile(ready to edit):
        ProfileKitchenModel.selectedProfile = emptyProfile
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // The picker take a list of profile names:
        pickerManager.nameForPicker()
        self.pickerView.reloadAllComponents()
        buttonLoadProfileAct((Any).self)
    }
    
    
    // MARK: PickerView preferences:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return profileManager.readProfiles().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ArrayKitchensNames.kitchensNames.count > 0 {
            return ArrayKitchensNames.kitchensNames[row]
        } else {
            return "No hay ningún perfil creado."
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == profileManager.readProfiles().count {
            //  Esto nos dará un profile igual en picker y aislado del array de enumerated, así podremos trabajar con sus valores de (nombre e imagen).
            if row > 0 {
                for profileFromPicker in profileManager.readProfiles() {
                    //1º: Igualamos el perfil obtenido "profileFromPicker" a los Models para acceder a la cocina:
                    ProfileKitchenModel.selectedProfile = profileFromPicker
                    //2º: Ahora le damos el valor de este perfil obtenido al labelProfile y al buttonProfile, para conseguir así la imagen del perfil seleccionado en el Picker:
                    labelProfileNameOut.text = profileFromPicker.name
                    buttonProfile.setImage(UIImage(named: profileFromPicker.imageName ?? "LogoPNGTenoch"), for: .normal)
                }
            } else {
                ProfileKitchenModel.selectedProfile = emptyProfile
                labelProfileNameOut.text = "You should create/select a profile!"
                buttonProfile.setImage(UIImage(named: "sombrero"), for: .normal)
            }
        }
    }
    
    
    // MARK: Actions:
    @IBAction func buttonLoadProfileAct(_ sender: Any) {
        // Upload Picker View names:
        ArrayKitchensNames.kitchensNames = []
        self.pickerView.reloadAllComponents()
        pickerManager.nameForPicker()
        self.pickerView.reloadAllComponents()
        
        // Upload the name of profile selected:
        if profileManager.readProfiles().count > 0 {
            if let showProfile: ProfileModel? = profileManager.readProfiles()[pickerView.selectedRow(inComponent: 0)] {
                // Layout:
                labelProfileNameOut.text = showProfile?.name
                labelProfileNameOut.reloadInputViews()
                buttonProfile.setImage(UIImage(named: showProfile?.imageName ?? "LogoPNGTenoch"), for: .normal)
                // Re-value the let showProfile to take the new value in other screen/files:
                ProfileKitchenModel.selectedProfile = showProfile
            }
        } else {
            ProfileKitchenModel.selectedProfile = emptyProfile
            labelProfileNameOut.text = "You should create/select a profile!"
            buttonProfile.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        
        // Print of values to see fails:
        print("\(profileManager.readProfiles().enumerated())" + "\n--------")
        print(ProfileKitchenModel.selectedProfile?.name ?? "NO HAY VALOR EN KITCHENMODEL.SELECTEDPROFILE.NAME")
    }
    
    
    @IBAction func buttonDeleteProfileAct(_ sender: Any) {
        // Alert and delete profile metod:
        let refreshAlert = UIAlertController(title: "Are you sure?", message: "Profile will be delete.", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction!) in
            // Start delete metod:
            if let profile = ProfileKitchenModel.selectedProfile {
                self.profileManager.removeProfile(profile)
            }
            // End delete metod.
            // Reset the showed profile preferences:
            self.labelProfileNameOut.text = "You should create/select a profile!"
            self.buttonProfile.setImage(UIImage(named: "sombrero"), for: .normal)
            ProfileKitchenModel.selectedProfile = self.emptyProfile
            
            // Upload the PickerView names:
            ArrayKitchensNames.kitchensNames = []
            self.pickerView.reloadAllComponents()
            self.pickerManager.nameForPicker()
            self.pickerView.reloadAllComponents()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonProfileAct(_ sender: Any) {
        if ProfileKitchenModel.selectedProfile != emptyProfile && pickerView.selectedRow(inComponent: 0) >= 0 {
            ProfileKitchenModel.selectedProfile =
                profileManager.readProfiles()[pickerView.selectedRow(inComponent: 0)]
            
            
            performSegue(withIdentifier: "goToTableList", sender: self)
        } else {
            ProfileKitchenModel.selectedProfile = emptyProfile
            performSegue(withIdentifier: "goToEditProfile", sender: self)
        }
    }
    
    
    @IBAction func buttonNewProfileAct(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
    }
    
    
    // End file.
}
