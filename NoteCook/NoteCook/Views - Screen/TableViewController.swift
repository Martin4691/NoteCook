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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // there are as many sections as Item.type cases.
//        return SectionType.allCases.count
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       // Aquí trato de acceder a los que sólo sean de un tipo
//        if tableView.numberOfSections == 0 {
//            return ProfileKitchenModel.arrayProducts?.filter({ $0.type })
//        }
////        let personajesFemeninos = elenco.filter({ $0.esChica })
////        print(personajesFemeninos)
        
        
        return ProfileKitchenModel.arrayProducts?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

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
    
    @IBAction func newItem(_ sender: Any) {
        performSegue(withIdentifier: "goToNewProduct", sender: self)
    }
    
}
    // MARK: - Extra Info
    
    extension TableViewController {
        enum SectionType: Int, CaseIterable {
            case meat, fish, vegetable, fruit, dessert, equipment, other
            
            var name: String {
                switch self {
                case .meat:
                    return "Meat"
                case .fish:
                    return "Fish"
                case .vegetable:
                    return "Vegetable"
                case .fruit:
                    return "Fruit"
                case .dessert:
                    return "Dessert"
                case .equipment:
                    return "Equipment"
                case .other:
                    return "Other"
                }
            }
        }
        
    }




