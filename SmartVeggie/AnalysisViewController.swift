import Foundation
import UIKit
import FanMenu
import Macaw

@available(iOS 11.0, *)
class AnalysisViewController: UIViewController, UINavigationControllerDelegate {
    
    //@IBOutlet weak var fanMenu: FanMenu!
   // @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var result: UILabel!
//    @IBOutlet weak var next: UIButton!
//    @IBOutlet weak var tableView: UITableView!
//    private var result: String
    private var rec: Recognition!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_recipe" {
            if let destinationVC = segue.destination as? RecipeViewController {
                destinationVC.selection = Ingredient2RecipeNum(ingredientName: (rec.getPrediction()?.first)!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // BackHome button
    @IBAction func BackHome(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue_back", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //create instance of the machine learning model
    override func viewWillAppear(_ animated: Bool) {
        self.rec = Recognition()
    }
    
    //when click camera
    @IBAction func camera(_ sender: Any) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.allowsEditing = false
        present(picker, animated: true)
    }
    
    //when click button "Album"
    @IBAction func album(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @IBAction func seeWhatIHave() {
        if let target = imageView?.image {
            if let output = rec.predict(image: target) {
                print("The output is: " + output)
                rec.addToPrediction(name: output)
                 result.text = output
            }
        }
    }
    
    func generateRecipe() {
        //show the matching result here
        if let predictions = rec.getPrediction() {
            for i in 0..<predictions.count {
                print("Keywords: \(predictions[i])")
            }
        }
    }
    @IBAction func RecommendRecipe(_ sender: UIButton) {
//let viewController = UIApplication.shared.keyWindow!.rootViewController as! MainController
//        viewController.Test()
      self.performSegue(withIdentifier: "segue_recipe", sender: self)
    }
    
    func Ingredient2RecipeNum (ingredientName:String) -> [Int] {
        switch ingredientName {
        case "Mushroom":
            return [0,1,5]
        case "French Loaf":
            return [0]
        case "Corn":
            return [2,7]
        case "Carbonara":
            return [3]
        case "Orange":
            return [4]
        case "Head Cabbage":
            return [5]
        case "Broccoli":
            return [6,7]
        case "Tofo":
            return [0]
        case "Spinach":
            return [0]
        case "Black fungus":
            return [2]
        case "White Gourd":
            return [2]
        case "Noodle":
            return [3]
        case "Garlic":
            return [3,4,5]
        case "Eggplant":
            return [3]
        case "Onion":
            return [4,5]
        case "Tomato":
            return [4,5,6]
        case "Cheese":
            return [5,6]
        default:
            return [99]
        }
    }
}

@available(iOS 11.0, *)
extension AnalysisViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true)
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        imageView.image = image
    }
}
