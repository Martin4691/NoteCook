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
    
    
    // MARK: Appear Cicle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        print("Comprobación de los perfiles de readProfile().enumerated(): \n\(profileManager.readProfiles().enumerated())")
        print("Comprobación nombres en ArrayKitchensNames.kitchenNames: \n\(ArrayKitchensNames.kitchensNames)")
        
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
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pickerManager.nameForPicker()
     
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
            ProfileKitchenModel.selectedProfile = nil
            labelProfileNameOut.text = "You should create/select a profile!"
            buttonProfile.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        }
        reloadInputViews()
    }
    
    
    // MARK: Actions:
    @IBAction func buttonLoadProfileAct(_ sender: Any) {
        // Actualiza los nombres del picker
        ArrayKitchensNames.kitchensNames = []
        self.pickerView.reloadAllComponents()
        pickerManager.nameForPicker()
        self.pickerView.reloadAllComponents()
        
        // actualiza el nombre del perfil seleccionado
        if profileManager.readProfiles().count > 0 {
           if let showProfile: ProfileModel? = profileManager.readProfiles()[pickerView.selectedRow(inComponent: 0)] {
            // Diseño:
            labelProfileNameOut.text = showProfile?.name
            labelProfileNameOut.reloadInputViews()
            buttonProfile.setImage(UIImage(named: showProfile?.imageName ?? "LogoPNGTenoch"), for: .normal)
            // Igualaciones para usar los perfiles en otras pantallas:
            ProfileKitchenModel.selectedProfile = showProfile
            }
        } else {
            labelProfileNameOut.text = "You should create/select a profile!"
            buttonProfile.setImage(UIImage(named: "sombrero"), for: .normal)
            
        }
        
        // Print de comprobación de perfiles
        print("\(profileManager.readProfiles().enumerated())" + "\n--------")
        print(ProfileKitchenModel.selectedProfile?.name ?? "NO HAY VALOR EN KITCHENMODEL.SELECTEDPROFILE.NAME")

        
    }
    
    @IBAction func buttonDeleteProfileAct(_ sender: Any) {
        // esto debería ser algo así:
            let refreshAlert = UIAlertController(title: "Are you sure?", message: "Profile will be delete.", preferredStyle: UIAlertController.Style.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction!) in
                
                // de aqui
                if let profile = ProfileKitchenModel.selectedProfile {
                    self.profileManager.removeProfile(profile)
                }
                
                // hasta aqui es la parte que elimina. El resto es la estructura del alert.
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            }))
            
            present(refreshAlert, animated: true, completion: nil)

        
        // Reset the showed profile preferences:
        labelProfileNameOut.text = "You should create/select a profile!"
        buttonProfile.setImage(UIImage(named: "sombrero"), for: .normal)

        
    }
    
    
    @IBAction func buttonProfileAct(_ sender: Any) {
        if ProfileKitchenModel.selectedProfile != nil {
            ProfileKitchenModel.selectedProfile =
                profileManager.readProfiles()[pickerView.selectedRow(inComponent: 0)]
            
            dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "goToTableList", sender: self)
        } else {
            performSegue(withIdentifier: "goToEditProfile", sender: self)
        }
    }
    
    
    
    @IBAction func buttonNewProfileAct(_ sender: Any) {
       
        performSegue(withIdentifier: "goToEditProfile", sender: self)
    }
    
    
    
// End file.
}
