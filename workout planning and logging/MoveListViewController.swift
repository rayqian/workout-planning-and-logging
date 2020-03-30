//
//  MoveListViewController.swift
//  workout planning and logging
//
//  Created by yv_qian on 3/6/20.
//  Copyright © 2020 yv_qian. All rights reserved.
//

import UIKit

class MoveListViewController: UITableViewController {
    var plan: Array<Move>?;
    var plan_row:Int?;//for the rearrange order method to send data back to the global variable in PlanListViewController
    
 
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = false;
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plan!.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sec_id", for: indexPath)
        
        let key = self.plan![indexPath.row].name;
        //let value = Array<Any>(self.plan!.values)[indexPath.row];
        let value = self.plan![indexPath.row].set;
        // Configure the cell...
        cell.textLabel?.text = key;
        cell.detailTextLabel?.text = String(value) + " sets"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            plan?.remove(at:indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .fade)
            plans[plan_row!].detail = plan!;
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    

 
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
//    //disable the delete button ahead of each cell
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//    }
    
//    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
    //enable the reorder control
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObject = self.plan![sourceIndexPath.row];
        plan?.remove(at: sourceIndexPath.row);
        plan?.insert(moveObject, at: destinationIndexPath.row)
        plans[plan_row!].detail = plan!;
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? AddingMoveViewController{
            detailViewController.plan_row = self.plan_row;
        }
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        
        
        plan = plans[plan_row!].detail;
        
        self.tableView.reloadData();
       }
}
