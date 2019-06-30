import Foundation
import UIKit
import Macaw
import FanMenu

class RecipeViewController: UIViewController {
    
    let colors = [0x231FE4, 0x00BFB6, 0xFFC43D, 0xFF5F3D, 0xF34766]
    
    var recipes: [Recipe] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipes = createArray()
        
    }
    
    func createArray() -> [Recipe] {
        
        var tempRecipes: [Recipe] = []
        
        let recipe1 = Recipe(image: UIImage(named: "Recipe1")!, name: "脆豆腐配炒香菇菠菜")
        let recipe2 = Recipe(image: UIImage(named: "Recipe2")!, name: "無水醬燒杏鮑菇")
        let recipe3 = Recipe(image: UIImage(named: "Recipe3")!, name: "味噌素菜餃子")
        let recipe4 = Recipe(image: UIImage(named: "Recipe4")!, name: "香辣雙色茄子意大利麵")
        let recipe5 = Recipe(image: UIImage(named: "Recipe5")!, name: "香橙甘荀洋蔥濃湯")
        let recipe6 = Recipe(image: UIImage(named: "Recipe6")!, name: "大啡菇漢堡")

        tempRecipes.append(recipe1)
        tempRecipes.append(recipe2)
        tempRecipes.append(recipe3)
        tempRecipes.append(recipe4)
        tempRecipes.append(recipe5)
        tempRecipes.append(recipe6)
        
        return tempRecipes
    }
    
}

extension RecipeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        
        cell.setRecipe(recipe: recipe)
        
        return cell
    }
}
