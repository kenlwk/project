import Foundation
import UIKit
import Macaw
import FanMenu

class RecipeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func BackHome(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue_back", sender: self)
    }
}
