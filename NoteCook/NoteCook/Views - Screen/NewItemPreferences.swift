//
//  NewItemPreferences.swift
//  NoteCook
//
//  Created by Martín on 30/1/21.
//

import Foundation
import UIKit

class NewItemPreferences: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    
    
    // Outlets:
    @IBOutlet weak var NameFieldOut: UITextField!
    
    @IBOutlet weak var limitOut: UITextField!
    @IBOutlet weak var MinimumOut: UITextField!
    
    @IBOutlet weak var pickerMeasureUnit: UIPickerView!
    
    @IBOutlet weak var pickerType: UIPickerView!
    
    @IBOutlet weak var labelContactOut: UILabel!
    
    @IBOutlet weak var saveButOut: UIButton!
    @IBOutlet weak var backButOut: UIButton!
    
    
    
    
    
    // Appear Cicle:
    override func viewDidLoad() {
        super.viewDidLoad()
          pickerType.dataSource = self
          pickerType.delegate = self
          pickerMeasureUnit.dataSource = self
          pickerMeasureUnit.delegate = self
        
    }
    
    
    
    
    
    // Pickers View:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerMeasureUnit {
            return Item.UnitMeasurement.allCases.count
        } else if pickerView == pickerType {
            return Item.ItemType.allCases.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerType {
            for name in Item.UnitMeasurement.allCases.enumerated() {
                return
                // mira si es mejor acceder así o si es mejor darle un valor String y cogerlo desde ahí. (Creo que va a ser lo segundo)
            }
            } else if pickerView == pickerMeasureUnit {
                return choices2[row]
            } else {
                return nil
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        
    }
    
    
//    enum ItemType {
//        case meat, fish, vegetable, fruit, dessert, equipment, other
//    }
//
//    enum UnitMeasurement {
//        case L, Kg, g, Box, Bottle, Pack, Other
//    }
//
    
    
    // Actions:
    @IBAction func contactButtonAct(_ sender: Any) {
        
    }
    

    @IBAction func saveButAct(_ sender: Any) {
        // Save metod:
       /* guard let name = textFieldOut.text
        else { return }
        let profile: ProfileModel = ProfileModel(name: name, imageName: ProfileKitchenModel.selectedProfile?.imageName ?? "LogoPNGTenoch")
        
        if let selectedProfile = ProfileKitchenModel.selectedProfile {
            profileManager.removeProfile(selectedProfile)
        }
        profileManager.saveProfile(profile)
        
        navigationController?.popViewController(animated: true)
    */
    }
    
    
    @IBAction func backButAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}








