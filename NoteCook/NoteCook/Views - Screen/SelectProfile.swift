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
    
    @IBOutlet weak var selectMode: UIBarButtonItem!
    @IBOutlet weak var editMode: UIBarButtonItem!
    
    
    var isEditMode: Bool = false
    func editionMode() {
     if isEditMode == false {
        selectMode.hide()
        editMode.show()
        editMode.title = "Edit Mode:"
        editMode.tintColor = .black
     } else {
        selectMode.show()
        selectMode.title = "Select Mode:"
        selectMode.tintColor = .black
        editMode.hide()
     }
    }
    
    
    //Appear Cicle:
    override func viewDidLoad() {
        //Aspect:
        isEditMode = false
        editionMode()
        
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        if profilesList.count > 0 && !isEditMode {
        subLabel1Out.text = profilesList[0].name
            button1Out.setImage(UIImage(named: profilesList[0].image), for: .normal)
        } else {
            subLabel1Out.text = "Name of kitchen"
            button1Out.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        
        if profilesList.count > 1 && !isEditMode{
        subLabel2Out.text = profilesList[1].name
            button2Out.setImage(UIImage(named: profilesList[1].image), for: .normal)
        } else {
            subLabel2Out.text = "Name of kitchen"
            button2Out.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        
        if profilesList.count > 2 && !isEditMode {
        subLabel3Out.text = profilesList[2].name
            button3Out.setImage(UIImage(named: profilesList[2].image), for: .normal)
        } else {
            subLabel3Out.text = "Name of kitchen"
            button3Out.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        
        if profilesList.count > 3 && !isEditMode {
        subLabel4Out.text = profilesList[3].name
            button4Out.setImage(UIImage(named: profilesList[3].image), for: .normal)
        }
        else {
            subLabel4Out.text = "Name of kitchen"
            button4Out.setImage(UIImage(named: "sombrero"), for: .normal)
        }
        
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
        isEditMode = false
         editionMode()
    }
    
    @IBAction func editModeButton(_ sender: Any) {
        isEditMode = true
         editionMode()
    }
    
    
    
   
    
    
    
    
    
    
    
}
