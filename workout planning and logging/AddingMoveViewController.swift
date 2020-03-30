//
//  AddingMoveViewController.swift
//  workout planning and logging
//
//  Created by yv_qian on 3/7/20.
//  Copyright © 2020 yv_qian. All rights reserved.
//

import UIKit

class AddingMoveViewController: UIViewController {
    
    var plan_row:Int?;

    @IBOutlet weak var moveField: UITextField!
    @IBOutlet weak var setField: UITextField!
    @IBOutlet weak var myStepper: UIStepper!
    

    
    @IBAction func editEnding(_ sender: UITextField) {
        sender.resignFirstResponder();
        if (sender == setField) {
        myStepper.value = Double(setField.text!)!;
        }
    }
    
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        moveField.resignFirstResponder();
        setField.resignFirstResponder();
    }
    
    @IBAction func adjustSet(_ sender: UIStepper) {
        
        sender.minimumValue = 0;
        sender.maximumValue = 99;
       
        setField.text = Int(sender.value).description;
        
    }
    
    @IBAction func clearInput(_ sender: UIButton) {
        moveField.text = "";
        
    }
    
    @IBAction func addInput(_ sender: UIButton) {
        if (moveField.text == "") {
            invalidMoveNameAlert();
        }
        //make sure the quantityField is neither empty nor non-Integer
        else if(setField.text == "" || Int(setField.text!) == nil) {
            invalidSetAlert();
        }

        else{
            let current_move = Move(move_name: moveField.text!, set: Int(setField.text!)!)
            plans[plan_row!].detail.append(current_move);
            
            let message = "You have added the exercise " + moveField.text! + " to this plan."
            let title = "Save successfully."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated:true, completion: nil)
            
        }
    }
    
    func invalidMoveNameAlert(){
        let message = "Please enter the move name before adding to your workout."
        let title = "Invalid input."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "I got it", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController, animated:true, completion: nil)
    }
    
    func invalidSetAlert(){
        let message = "Please enter a valid set before adding to your workout."
        let title = "Invalid input."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController, animated:true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setField.text = "4";
        moveField.text = "";
        myStepper.value = 4;
        
        // Do any additional setup after loading the view.
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let current_move = Move(move_name: moveField.text!, set: Int(setField.text!)!)
        
        if let destinationViewController = segue.destination as? MoveListViewController{
            destinationViewController.plan?.append(current_move)
               }
    }
  */

}
