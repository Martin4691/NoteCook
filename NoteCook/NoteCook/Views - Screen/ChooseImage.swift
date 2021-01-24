//
//  ChooseImage.swift
//  NoteCook
//
//  Created by Martín on 03/01/2021.
//

import Foundation
import UIKit

class ChooseImage: UIViewController {

    
    @IBOutlet weak var viewLabelOut: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLabelOut.layer.cornerRadius = 40
        viewLabelOut.layer.borderWidth = 2
        viewLabelOut.layer.borderColor = UIColor.brown.cgColor
    }
    
    
    
    @IBAction func backButtonAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func image1(_ sender: Any) {
        ProfileKitchenModel.selectedProfile?.imageName = "png_1"
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image2(_ sender: Any) {
        ProfileKitchenModel.selectedProfile?.imageName = "png_2"
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image3(_ sender: Any) {
        ProfileKitchenModel.selectedProfile?.imageName = "png_3"
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image4(_ sender: Any) {
        ProfileKitchenModel.selectedProfile?.imageName = "png_4"
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image5(_ sender: Any) {
        ProfileKitchenModel.selectedProfile?.imageName = "png_5"
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    

    
    
}
