//
//  EditProfile.swift
//  NoteCook
//
//  Created by Martín on 03/01/2021.
//

import Foundation
import UIKit

class EditProfile: UIViewController {
    
    @IBOutlet weak var imageButOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        imageButOut.layer.cornerRadius = 5
        
    }
    
    @IBAction func imageButtonAct(_ sender: Any) {
        self.performSegue(withIdentifier: "goToImages", sender: self)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
}
