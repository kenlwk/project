//
//  DetailedRecipeViewController.swift
//  SmartVeggie
//
//  Created by Ken Li on 4/7/2019.
//  Copyright © 2019 Exyte. All rights reserved.
//

import UIKit

class DetailedRecipeViewController: UIViewController {

    var segueData : (String,String,Int) = ("title","label",30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print(segueData.0)
        print(segueData.1)
        print(segueData.2)
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueback", sender: self)
    }
    
    
    

}
