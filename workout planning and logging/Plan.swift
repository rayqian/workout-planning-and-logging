//
//  Plan.swift
//  workout planning and logging
//
//  Created by yv_qian on 3/5/20.
//  Copyright © 2020 yv_qian. All rights reserved.
//

import Foundation



class Plan{
    var plan_name: String;
    var detail:Array<Move>;
    
    init(name:String, detail:Array<Move>){
        plan_name = name;
        self.detail = detail;
    }
    
    
}



