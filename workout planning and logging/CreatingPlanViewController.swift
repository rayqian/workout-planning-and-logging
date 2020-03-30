//
//  CreatingPlanViewController.swift
//  workout planning and logging
//
//  Created by yv_qian on 3/14/20.
//  Copyright © 2020 yv_qian. All rights reserved.
//

import UIKit

class CreatingPlanViewController: UIViewController {

    @IBOutlet weak var plan_name_field: UITextField!
    
    
    @IBAction func TextEnding(_ sender: UITextField) {
        sender.resignFirstResponder();
    }
    
    
    @IBAction func BackgroundTouched(_ sender: UIControl) {
        plan_name_field.resignFirstResponder();
    }
    
    
    @IBAction func cancelCreating(_ sender: UIButton) {
        dismiss(animated: true, completion:nil);
    }
    
    
    @IBAction func createPlan(_ sender: UIButton) {
        let name = plan_name_field.text;
        let newArray:Array<Move> = [Move]();
        plan_details.append(newArray);
        
        if name == ""{
            invalidPlanNameAlert();
        }
        else{
            plans.append(Plan(name: name!, detail: plan_details[plan_details.endIndex-1]));
            dismiss(animated: true, completion: nil);
//            switchToPlan();
        }
    }
    
    func invalidPlanNameAlert(){
        let message = "Please enter a valid plan name."
        let title = "Invalid input."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "I got it", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController, animated:true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    func switchToPlan(){
//        if let from = presentingViewController as? PlanListViewController{
//            from.updateView();
//
//        }
//        dismiss(animated: true, completion: nil);
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let from = presentingViewController as? PlanListViewController{
//            from.updateView();
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
