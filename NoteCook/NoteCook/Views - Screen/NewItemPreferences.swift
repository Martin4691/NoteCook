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
    
    @IBOutlet var viewContainerOut: UIView!
    
    @IBOutlet weak var saveButOut: UIButton!
    
    
    let profileManager: ProfileManager = ProfileManager()
    var profileItemList = ProfileKitchenModel.selectedProfile?.itemList
    // Con esto en teoria puedo acceder a la lista y hacerle un append del newItem
    
    
    
    var newItem: Item = .init(name: "Insert name here", kgInKitchen: 0, kgMinimum: 0, kgLimit: 0, supplier: "Select supplier contact", typeSelected: "None", unitSelected: "None")
    
    var emptyItem: Item = .init(name: "Insert name here", kgInKitchen: 0, kgMinimum: 0, kgLimit: 0, supplier: "Select supplier contact", typeSelected: "None", unitSelected: "None")
    
    
    
    // MARK: - Appear Cicle:
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerType.dataSource = self
        pickerType.delegate = self
        pickerMeasureUnit.dataSource = self
        pickerMeasureUnit.delegate = self
        
        pickerType.dataSource = self
        pickerType.delegate = self
        pickerMeasureUnit.delegate = self
        pickerMeasureUnit.dataSource = self
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            
        NameFieldOut.text = emptyItem.name
        limitOut.text = String(describing: emptyItem.kgLimit)
        MinimumOut.text = String(describing: emptyItem.kgMinimum)
        labelContactOut.text = emptyItem.supplier
        
        
    }
    
    
    
    // Pickers View:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerMeasureUnit {
            return Item.unitForMeasurement.count
        } else if pickerView == pickerType {
            return Item.type.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pickerMeasureUnit {
            return Item.unitForMeasurement[row]
        } else if pickerView == pickerType  {
            return Item.type[row]
        } else {
            return "No enum selected"
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == pickerMeasureUnit {
            if row == Item.unitForMeasurement[row].count
            {
                if row == 0 {
                    newItem.typeSelected = "L"
                } else if row == 1 {
                    newItem.typeSelected = "Kg"
                } else if row == 2 {
                    newItem.typeSelected = "g"
                } else if row == 3 {
                    newItem.typeSelected = "Box"
                } else if row == 4 {
                    newItem.typeSelected = "Bottle"
                } else if row == 5 {
                    newItem.typeSelected = "Pack"
                } else if row == 6 {
                    newItem.typeSelected = "Other"
                }
            }
        } else if pickerView == pickerType {
            if row == Item.type[row].count {
                if row == 0 {
                    newItem.typeSelected = "Meat"
                } else if row == 1 {
                    newItem.typeSelected = "Fish"
                } else if row == 2 {
                    newItem.typeSelected = "Vegetable"
                } else if row == 3 {
                    newItem.typeSelected = "Fruit"
                } else if row == 4 {
                    newItem.typeSelected = "Dessert"
                } else if row == 5 {
                    newItem.typeSelected = "Equipment"
                } else if row == 6 {
                    newItem.typeSelected = "Drinks"
                } else if row == 7 {
                    newItem.typeSelected = "Other"
                }
            }
        }
    }
    
    
    // Actions:
    @IBAction func contactButtonAct(_ sender: Any) {
        // temporary print
        
    }
    
    
    @IBAction func saveButAct(_ sender: Any) {
        // Save metod:
        newItem.name = NameFieldOut.text
        newItem.kgLimit = Int(limitOut.text ?? "0")
        newItem.kgMinimum = Int(MinimumOut.text ?? "0")
        
        ProfileKitchenModel.selectedProfile?.itemList.append(newItem)
        

        //Aquí entra el mejunge:
        let profile: ProfileModel = ProfileKitchenModel.selectedProfile!
        
        if let selectedProfile = ProfileKitchenModel.selectedProfile {
            profileManager.removeProfile(selectedProfile)
        }
        profileManager.saveProfile(profile)
        //
    
        
        print(ProfileKitchenModel.selectedProfile?.itemList)
        
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func backButAct(_ sender: Any) {
        
        
        
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
}


