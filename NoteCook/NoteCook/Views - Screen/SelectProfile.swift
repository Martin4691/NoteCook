//
//  SelectProfile.swift
//  NoteCook
//
//  Created by Martín on 16/01/2021.
//

import Foundation
import UIKit

class SelectProfile: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var labelArrows: UILabel!
    
    @IBOutlet weak var buttonStock: UIButton!
    @IBOutlet weak var labelStock: UILabel!
    
    @IBOutlet weak var buttonProfile: UIButton!
    @IBOutlet weak var labelProfile: UILabel!
    
    @IBOutlet weak var ButtonNewProfile: UIButton!
    
    let profileManager: ProfileManager = ProfileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
                    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        if let profileImage = ProfileEditionModel.image {
            buttonProfile.setImage(UIImage(named: profileImage), for: .normal)
        } else {
            buttonProfile.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        
        
        for nameProfile in profileManager.readProfiles().enumerated() {
            ArrayKitchensNames.kitchensNames.append(nameProfile.element.name)
            
        
        }
            
            reloadInputViews()
        
        
    
    }
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    

    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return ArrayKitchensNames.kitchensNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return // hay que hacer alguna forma de que cuando se actualicen los datos con lo del nameProfile en el viewWillAppear no se vuelva a meter la arrayKitchens de los cojones entera otrave + el nuevo nombre del perfil.
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    }
    
    
    
    @IBAction func buttonStockAct(_ sender: Any) {
        self.pickerView.reloadAllComponents()
        
        
        print(profileManager.readProfiles().enumerated())
    }
    
    @IBAction func buttonProfileAct(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
    }
    
    @IBAction func buttonNewProfileAct(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
