//
//  Recipe.swift
//  SmartVeggie
//
//  Created by Ken Li on 30/6/2019.
//  Copyright © 2019 Exyte. All rights reserved.
//

import Foundation
import UIKit

class Recipe {
    
    private var image: UIImage
    private var name: String
    
    init(image: UIImage, name: String) {
        self.image = image
        self.name = name
    }
    
    func getName() -> String? {
        return self.name;
    }
    
    func getImage() -> UIImage? {
        return self.image
    }
    
}
