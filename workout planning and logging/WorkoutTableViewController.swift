//
//  WorkoutTableViewController.swift
//  workout planning and logging
//
//  Created by yv_qian on 3/16/20.
//  Copyright © 2020 yv_qian. All rights reserved.
//

import UIKit


var selected_plan_id: Int = 0;

class WorkoutTableViewController: UITableViewController {
    var working_plan:Plan?;
    var workout_table:Array<String> = [String]();
    var workout_set_table:Array<Int> = [Int]();
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        //add gesture recognizer to dismiss keyboard when touching the background
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UITableViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false;
        view.addGestureRecognizer(tap);
        
        //disable selection for the table view
        tableView.allowsSelection = false;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        working_plan = plans[selected_plan_id];
        let move_count:Int = (working_plan?.detail.count)!;
        for p in 0..<move_count{
            let setno:Int = (working_plan?.detail[p].set)!;
            let setname:String = (working_plan?.detail[p].name)!;
            for set in 1...setno{
                workout_table.append(setname);
                workout_set_table.append(set);
            }
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workout_table.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "workout_id", for: indexPath)
        let plan = workout_table[indexPath.row];
        let set_no = workout_set_table[indexPath.row];
         // Configure the cell...
        cell.textLabel?.text = plan;
        cell.detailTextLabel?.text = "set no." + String(set_no);
        return cell
    }
}

   
//extend the UITableViewController to implement gesture
extension UITableViewController{
    @objc
    func dismissKeyboard(){
        view.endEditing(true);
    }
}
