import Foundation
import UIKit
import FanMenu
import Macaw

@available(iOS 11.0, *)
class AnalysisViewController: UIViewController, UINavigationControllerDelegate {
    
    //@IBOutlet weak var fanMenu: FanMenu!
   // @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var next: UIButton!
//    @IBOutlet weak var tableView: UITableView!
//    private var result: String
    private var rec: Recognition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                print(output)
                rec.addToPrediction(name: output)
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
    
    
}

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
