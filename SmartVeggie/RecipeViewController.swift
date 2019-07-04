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
                   "Broccoli Quinoa Crust Pizza",
                   "Tomato & Mixed Veggies Turmeric Rice"
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
    
    var pressedRow : Int = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        pressedRow=indexPath.row
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showdetail" {
            if let destinationVC = segue.destination as? DetailedRecipeViewController {
                
                destinationVC.segueData = (recipes[pressedRow],
                                           recipes[pressedRow]+".jpg",
                                           "ingredient placeholder, for example shoidfhaosdh",
                                           "step placeholder, for example aoshdfposihfd",
                                           pressedRow)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func BackHome(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue_back", sender: self)
    }
}
