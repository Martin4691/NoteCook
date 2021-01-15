//
//  EditProfile.swift
//  NoteCook
//
//  Created by Martín on 03/01/2021.
//

import Foundation
import UIKit

class EditProfile: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var textFieldOut: UITextField!
    @IBOutlet weak var imageButOut: UIButton!
    @IBOutlet weak var pickerViewOut: UIPickerView!
    
    
    let choosedImage = ChooseImage()
    let profile = ProfileModel()
    var kitchenSelected: Int? = nil
    var pickerArray = ["Kitchen 1", "Kitchen 2", "Kitchen 3", "Kitchen 4"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        imageButOut.layer.cornerRadius = 5
        
        self.pickerViewOut.dataSource = self
        self.pickerViewOut.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let avatarImageName = ProfileModel.imageName {
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
        if kitchenSelected == 0 {
            profilesList.remove(at: 0)
            profilesList.insert(ProfileNumber(name: textFieldOut.text!, image: ProfileModel.imageName!), at: 0)
            
        } else if kitchenSelected == 1 {
            profilesList.remove(at: 1)
            profilesList.insert(ProfileNumber(name: textFieldOut.text!, image: ProfileModel.imageName!), at: 1)
            
        } else if kitchenSelected == 2 {
            profilesList.remove(at: 2)
            profilesList.insert(ProfileNumber(name: textFieldOut.text!, image: ProfileModel.imageName!), at: 2)
            
        } else {
            profilesList.remove(at: 3)
            profilesList.insert(ProfileNumber(name: textFieldOut.text!, image: ProfileModel.imageName!), at: 3)
            
        }
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    //    if kitchen1 = profile[1]
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
    if (row == 0) {
        kitchenSelected = 1
 
    } else if (row == 1) {
        kitchenSelected = 2
    
    } else if (row == 2) {
        kitchenSelected = 3
    
    }else {
        kitchenSelected = 4
    
    }
    }
    
    
    
}
