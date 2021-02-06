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
    
    
//    var newItem: Item = Item(name: "", supplier: "")
//    let emptyItem: Item = Item(name: "Insert name here...", supplier: "Select supplier contact:")
    
    
    
    
    // Appear Cicle:
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
//        NameFieldOut.text = emptyItem.name
//        labelContactOut.text = emptyItem.supplier
    
        
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
            //            aqui se pondra lo que se guarda del Item segun su  Item.UnitMeasurement. ejem Kg.
            if row == Item.type[row].count {
                if row == 0 {
                    "L"
                } else if row == 1 {
                    "Kg"
                } else if row == 2 {
                    "g"
                } else if row == 3 {
                    "Box"
                } else if row == 4 {
                    "Bottle"
                } else if row == 5 {
                    "Pack"
                } else if row == 6 {
                    "Other"
                }
            }
            
            
            
        } else if pickerView == pickerType  {
            //            aqui se pondra lo que se guarda del Item segun su  Item.ItemType. ejem Fruit.
            
            //              asignar a una row de la array Item.type[row] un color.
            
            if row == Item.type[row].count {
                if row == 0 {
                    "Meat"
                } else if row == 1 {
                    "Fish"
                } else if row == 2 {
                    "Vegetable"
                } else if row == 3 {
                    "Fruit"
                } else if row == 4 {
                    "Dessert"
                } else if row == 5 {
                    "Equipment"
                } else if row == 6 {
                    "Other"
                }
            }
        }
    }
    
    
    // Actions:
    @IBAction func contactButtonAct(_ sender: Any) {
        
    }
    
    
    @IBAction func saveButAct(_ sender: Any) {
        // Save metod:
        
        
        
        
        
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func backButAct(_ sender: Any) {
        
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
}


