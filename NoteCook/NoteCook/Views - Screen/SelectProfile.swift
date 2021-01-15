//
//  SelectProfile.swift
//  NoteCook
//
//  Created by Martín on 03/01/2021.
//

import Foundation
import UIKit

class SelectProfile: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var button1Out: UIButton!
    @IBOutlet weak var label1Out: UILabel!
    @IBOutlet weak var button2Out: UIButton!
    @IBOutlet weak var label2Out: UILabel!
    @IBOutlet weak var button3Out: UIButton!
    @IBOutlet weak var label3Out: UILabel!
    @IBOutlet weak var button4Out: UIButton!
    @IBOutlet weak var label4Out: UILabel!
    
    @IBOutlet weak var subLabel1Out: UILabel!
    @IBOutlet weak var subLabel2Out: UILabel!
    @IBOutlet weak var subLabel3Out: UILabel!
    @IBOutlet weak var subLabel4Out: UILabel!
    
    
    override func viewDidLoad() {
        // Configurating the items screen:
        
        subLabel1Out.layer.cornerRadius = 20
        subLabel1Out.layer.borderWidth = 2
        subLabel1Out.layer.borderColor = UIColor.black.cgColor
        subLabel2Out.layer.cornerRadius = 20
        subLabel2Out.layer.borderWidth = 2
        subLabel2Out.layer.borderColor = UIColor.black.cgColor
        subLabel3Out.layer.cornerRadius = 20
        subLabel3Out.layer.borderWidth = 2
        subLabel3Out.layer.borderColor = UIColor.black.cgColor
        subLabel4Out.layer.cornerRadius = 20
        subLabel4Out.layer.borderWidth = 2
        subLabel4Out.layer.borderColor = UIColor.black.cgColor
        
        
        
    }
    
    
    
    
    @IBAction func button1Act(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
         
        
        
    }
    
    @IBAction func button2Act(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
        
    }
    
    @IBAction func button3Act(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
        
    }
    
    @IBAction func button4Act(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
        
    }
    
    
    
    @IBAction func selectModeButton(_ sender: Any) {
        
    }
    
    @IBAction func editModeButton(_ sender: Any) {
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
