import Foundation
import UIKit
import Macaw
import FanMenu

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let recipes = ["Stir-fried Spinach with Mushroom and Crispy Tofu",
                   "Self-Basting Grilled French Horn Mushroom",
                   "Miso vegetarian dumplings",
                   "Spicy two-toned eggplant spaghetti",
                   "Orange Ganzi Onion Soup",
                   "Portobello Mushroom Burger",
                   "Broccoli Quinoa Crust Pizza"
                    ]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (recipes.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeTableViewCell
        
        cell.myImage.image = UIImage(named: ( recipes[indexPath.row] + ".jpg"))
        cell.myLabel.text = recipes[indexPath.row]
        return (cell)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func BackHome(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue_back", sender: self)
    }
}
