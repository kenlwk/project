//
//  DetailedRecipeViewController.swift
//  SmartVeggie
//
//  Created by Ken Li on 4/7/2019.
//  Copyright © 2019 Exyte. All rights reserved.
//

import UIKit

class DetailedRecipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueback", sender: self)
    }
    
    
    

}
