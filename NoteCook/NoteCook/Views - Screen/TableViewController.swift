//
//  TableViewController.swift
//  NoteCook
//
//  Created by Martín on 30/1/21.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

               
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        
        
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

//        return Item.type.count
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ProfileKitchenModel.selectedProfile?.itemList.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandardCell", for: indexPath)

        // Configure the cell...

        if let itemCell = (cell as? StandardCell),
           let name = ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].name
        {
            itemCell.labelNameOut.text = name
            
            // Color:
            if (ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgInKitchen)! >= (ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgLimit)! {
                itemCell.colorIconOut.backgroundColor = UIColor.green
            } else if (ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgInKitchen)! <= (ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgLimit)! {
                itemCell.colorIconOut.backgroundColor = UIColor.yellow
            } else if (ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgLimit)! <= (ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgMinimum)! {
                itemCell.colorIconOut.backgroundColor = UIColor.red
            } else if ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgInKitchen == 0 {
                itemCell.colorIconOut.backgroundColor = UIColor.black
            }

            itemCell.deleteButOut.layer.cornerRadius = 5
            itemCell.deleteButOut.layer.borderWidth = 3
            itemCell.deleteButOut.layer.borderColor = UIColor.brown.cgColor
                
//            itemCell.kgStockPicker
            
            itemCell.kgToRedOut.text = "\(ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgMinimum ?? 0000)"
            
            itemCell.kgToYellowOut.text = "\(ProfileKitchenModel.selectedProfile?.itemList[indexPath.row].kgLimit ?? 0000)"
            
//            itemCell.supplierButOut
            
            
        } else {
            cell.backgroundColor = .black
          
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
       
    @IBAction func newItemButton(_ sender: Any) {
        performSegue(withIdentifier: "goToNewProduct", sender: self)
    }
    
}




