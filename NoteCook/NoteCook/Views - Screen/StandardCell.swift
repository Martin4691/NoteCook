//
//  standardCell.swift
//  NoteCook
//
//  Created by Martín on 03/01/2021.
//

import UIKit

class StandardCell: UITableViewCell {

   
    // Start:
    
    
    @IBOutlet weak var colorIconOut: UIView!
    @IBOutlet weak var labelNameOut: UILabel!
    @IBOutlet weak var kgStockPicker: UIPickerView!
    @IBOutlet weak var kgToYellowOut: UILabel!
    @IBOutlet weak var kgToRedOut: UILabel!
    
    @IBOutlet weak var supplierButOut: UIButton!
    @IBAction func supplierButAct(_ sender: Any) {
    }
    
    @IBOutlet weak var deleteButOut: UIButton!
    @IBAction func deleteButAct(_ sender: Any) {
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        colorIconOut.layer.cornerRadius = 5
        colorIconOut.backgroundColor? = colorIcon()
        
        deleteButOut.layer.cornerRadius = 5
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // The next func return the color for colorIconOut:
    func colorIcon() -> UIColor {
        
        let green: UIColor = .green
        let yellow: UIColor = .yellow
        let red: UIColor = .red
        let black: UIColor = .black

        if Item.kgInKitchen > Item.kgLimit && Item.kgInKitchen > Item.kgMinimum {
           
            return green
        
        } else if Item.kgInKitchen < Item.kgLimit && Item.kgInKitchen > Item.kgMinimum {
            
            return yellow
            
        } else if Item.kgInKitchen < Item.kgLimit && Item.kgInKitchen < Item.kgMinimum {
            
            return red
        
        } else {
            return black
        }
        
        
        
        
    }
    
    
    
    
    
}
