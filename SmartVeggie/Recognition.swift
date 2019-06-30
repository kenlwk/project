//
//  YOLO.swift
//  Smart Veggie
//
//  Created by lttc on 23/6/2019.
//  Copyright © 2019 Team B. All rights reserved.
//

import UIKit
import CoreML

@available(iOS 11.0, *)
class Recognition {
    
    var model: MobileNetV2!
    var prediction: [String]!
    
    init() {
        
    }
    
    //this function expect an UIImage as input, UIImage is the Image fetched from the UIImageView
    func predict(image: UIImage) -> String? {
        if let scaledImage = image.resizeImage(size: CGSize(width: 224, height: 224)) { //resize image to certain dimension
            print("image resized \(scaledImage.size.width), \(scaledImage.size.height)") //print resized image information
            if let pixelBuffer = ImageProcessor.generatePixelBuffer(source: scaledImage.cgImage!) {
                guard let output = try? self.model.prediction(image: pixelBuffer) else { fatalError("Unexpected runtime error") }
                self.addToPrediction(name: output.classLabel)
                return output.classLabel
            }
        }
        return nil
    }
    
    func addToPrediction(name: String) {
        self.prediction.append(name)
    }
    
    func getPrediction() -> [String]? {
        for p in self.prediction {
            print(p)
        }
        return self.prediction
    }
    
}

//Extension of class UIImage, add two more functions
extension UIImage {
    func resizeImage(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size);
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        if let resizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return resizedImage
        }
        return nil
    }
    
    func scaleImage(rate: CGFloat) -> UIImage? {
        let scale = CGSize(width: self.size.width * rate, height: self.size.height * rate)
        return resizeImage(size: scale)
    }
}
