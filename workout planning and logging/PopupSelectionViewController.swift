//
//  PopupSelectionViewController.swift
//  workout planning and logging
//
//  Created by yv_qian on 3/15/20.
//  Copyright © 2020 yv_qian. All rights reserved.
//

import UIKit



class PopupSelectionViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    

    @IBOutlet weak var planPicker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        plans.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String?{
        
        return String(plans[row].plan_name);
    }
    
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startAction(_ sender: UIButton) {
        selected_plan_id = planPicker.selectedRow(inComponent: 0);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planPicker.delegate = self;
        planPicker.dataSource = self;
        // Do any additional setup after loading the view.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
