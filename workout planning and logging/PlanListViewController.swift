//
//  PlanListViewController.swift
//  workout planning and logging
//
//  Created by yv_qian on 3/5/20.
//  Copyright © 2020 yv_qian. All rights reserved.
//

import UIKit

var plan_details: Array<Array<Move>> = [
                                        [Move(move_name: "push-up", set:4),
                                        Move(move_name: "bench press", set:4),
                                        Move(move_name: "inclined bench press", set:4),
                                        Move(move_name: "declined bench press", set: 3)],

                                        [Move(move_name: "lats pull-down", set:4),
                                         Move(move_name: "chin-up", set:4),
                                         Move(move_name: "barbell rowing", set:4)]
                                                                                        ];

var plans = [Plan(name:"default_plan1", detail:plan_details[0]),
             Plan(name: "default_plan2", detail:plan_details[1])];


class PlanListViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return plans.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "first_id", for: indexPath)
        let plan = plans[indexPath.row];
        // Configure the cell...
        cell.textLabel?.text = plan.plan_name;
       // cell.detailTextLabel?.text = plan.
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
            plans.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let moveObject = plans[fromIndexPath.row];
        plans.remove(at: fromIndexPath.row);
        plans.insert(moveObject, at: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? MoveListViewController{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                detailViewController.plan = plans[indexPath.row].detail;
                detailViewController.plan_row = indexPath.row;
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
          self.tableView.reloadData();
          
         }
    
//    func updateView(){
//        self.tableView.reloadData();
//        testField.text = String(plans.count);
//    }
    
    @IBAction func unwindToPlanList(_ unwindSegue: UIStoryboardSegue){}

}
