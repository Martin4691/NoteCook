//
//  EditProfile.swift
//  NoteCook
//
//  Created by Martín on 03/01/2021.
//

import Foundation
import UIKit

class EditProfile: UIViewController {
    
    @IBOutlet weak var textFieldOut: UITextField!
    @IBOutlet weak var imageButOut: UIButton!
    
    let choosedImage = ChooseImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        imageButOut.layer.cornerRadius = 5
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let avatarImageName = Profile.imageName {
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
       
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
}
