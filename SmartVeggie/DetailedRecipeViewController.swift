//
//  DetailedRecipeViewController.swift
//  SmartVeggie
//
//  Created by Ken Li on 4/7/2019.
//  Copyright © 2019 Exyte. All rights reserved.
//

import UIKit

class DetailedRecipeViewController: UIViewController {

    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    var segueData : (String,String,String,String,Int) = ("title","label","ingredients","steps",30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        print(segueData.0)
//        print(segueData.1)
//        print(segueData.2)
        recipeNameLabel.text = segueData.0
        recipeImage.image = UIImage(named: segueData.1)
        ingredientLabel.text = segueData.2
        stepLabel.text = segueData.3
        
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueback", sender: self)
    }
    
    
    

}
