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
    
    @IBOutlet weak var viewRefreshOut: UIView!
    @IBOutlet weak var viewLabelRefreshOut: UIView!
    
    @IBOutlet weak var viewLabelProfileOut: UIView!
    @IBOutlet weak var labelProfileNameOut: UILabel!
    
    @IBOutlet weak var buttonProfile: UIButton!

    @IBOutlet weak var ButtonNewProfile: UIButton!
    
    
    // MARK: Appear Cicle:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        
        // Screen Elements Layout:
        viewChooseOut.layer.cornerRadius = 20
        viewChooseOut.layer.borderWidth = 3
        viewChooseOut.layer.borderColor = UIColor.brown.cgColor
        
        pickerView.layer.cornerRadius = 30
        pickerView.layer.borderWidth = 5
        pickerView.layer.borderColor = UIColor.black.cgColor
        
        viewRefreshOut.layer.cornerRadius = 15
        viewRefreshOut.layer.borderColor = UIColor.brown.cgColor
        viewRefreshOut.layer.borderWidth = 3
        
        viewLabelRefreshOut.layer.cornerRadius = 5
        viewLabelRefreshOut.layer.borderColor = UIColor.brown.cgColor
        viewLabelRefreshOut.layer.borderWidth = 3
        
        viewLabelProfileOut.layer.cornerRadius = 10
        viewLabelProfileOut.layer.borderWidth = 3
        viewLabelProfileOut.layer.borderColor = UIColor.brown.cgColor
        
        ButtonNewProfile.layer.borderColor = UIColor.black.cgColor
        ButtonNewProfile.layer.borderWidth = 3
        // Layout end.
        
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let profileImage = ProfileEditionModel.image {
            buttonProfile.setImage(UIImage(named: profileImage), for: .normal)
        } else {
            buttonProfile.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        
        pickerManager.nameForPicker()
            
        
        if let showName = ArrayKitchensNames.kitchensNames[pickerView.selectedRow(inComponent: 0)] {
            labelProfileNameOut.text = showName
            labelProfileNameOut.reloadInputViews()
            
        } else {
            labelProfileNameOut.text = "You should create/select a profile!"
            
        }
        
        
    }
    

    // MARK: PickerView preferences:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return ArrayKitchensNames.kitchensNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return ArrayKitchensNames.kitchensNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
    
    
    // MARK: Actions:
    @IBAction func buttonRefreshAct(_ sender: Any) {
            // Actualiza los nombres del picker
        ArrayKitchensNames.kitchensNames = []
        self.pickerView.reloadAllComponents()
        pickerManager.nameForPicker()
        self.pickerView.reloadAllComponents()
        
            // actualiza el nombre del perfil seleccionado
        if let showName = ArrayKitchensNames.kitchensNames[pickerView.selectedRow(inComponent: 0)] {
            labelProfileNameOut.text = showName
            labelProfileNameOut.reloadInputViews()
            
        } else {
            labelProfileNameOut.text = "You should create/select a profile!"
            
        }
        
        
            // Print de comprobación de perfiles
        print(profileManager.readProfiles().enumerated())
    }
    
    @IBAction func buttonProfileAct(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
    }
    
    @IBAction func buttonNewProfileAct(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
