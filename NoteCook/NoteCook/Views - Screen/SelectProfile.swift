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
    
    
    
    override func viewDidLoad() {
        // Configurating the items screen:
        
        
        
        
    }
    
    
    
    
    @IBAction func button1Act(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
        if 
        
        
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
