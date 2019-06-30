//
//  IntroViewController.swift
//  SmartVeggie
//
//  Created by Ken Li on 30/6/2019.
//  Copyright © 2019 Exyte. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func BackHome(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue_back", sender: self)
    }
}
