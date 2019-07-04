import Foundation
import UIKit
import Macaw
import FanMenu

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let recipes = ["Recipe1", "Recipe2", "Recipe3"]
    
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
