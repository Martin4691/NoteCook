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
    
    @IBOutlet weak var buttonDelete: UIButton!
    @IBOutlet weak var labelDelete: UILabel!
    
    
    @IBOutlet weak var buttonProfile: UIButton!
    @IBOutlet weak var labelProfile: UILabel!
    
    @IBOutlet weak var ButtonNewProfile: UIButton!
    
    
    
    override func viewDidLoad() {
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    
    
    
    @IBAction func buttonStockAct(_ sender: Any) {
    }
    
    
    @IBAction func buttonDeleteAct(_ sender: Any) {
    }
    
    @IBAction func buttonProfileAct(_ sender: Any) {
    }
    
    @IBAction func buttonNewProfileAct(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
