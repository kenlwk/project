import Foundation
import UIKit
import Macaw
import FanMenu

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selection=[99]
    var toPresent=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toPresent = recipes
        if selection.contains(99) {
            return
        }
        var toKeep = [String]()
        for i in selection{
            toKeep.append(recipes[i])
        }
        toPresent.removeAll(where: { !toKeep.contains($0)})
    }
    
    @IBAction func BackHome(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue_back", sender: self)
    }
    
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
        return (toPresent.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeTableViewCell
        
        cell.myImage.image = UIImage(named: ( toPresent[indexPath.row] + ".jpg"))
        cell.myLabel.text = toPresent[indexPath.row]
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
                
                //ingredient database
                var ingredients = String()
                switch pressedRow {
                case 0:
                    ingredients = " - 1 brick Hard Tofu \n - 1 tbsp Coconut oil - \n - 1⁄4 teaspoon of cumin powder \n - 1⁄4 teaspoon of chopped dry cilantro \n - 1⁄2 teaspoon of turmeric powder \n - 2 Mushrooms \n - 1 spinach - 1 piece of toast"
                    break
                case 1:
                    ingredients = " 3 French Horn Mushrooms \n 2 tablespoons soy sauce \n 1 tbsp Ginger juice \n a little sesame oil \n 1 teaspoon rice wine \n 1 teaspoon sugar \n a little Black pepper \n 3 tablespoons Miso"
                    break
                case 2:
                    ingredients = " Black fungus 20g (cut strip) \n White fungus 20g (cut strip) \n White Gourd 40g (cut small) \n Flammulina velutipes (one pack) \n Buckwheat 10g \n Dumpling wrappings 15-20 pieces"
                    break
                case 3:
                    ingredients = " 100 g spaghetti noodles \n 2 tbsp olive oil \n 4 pieces of garlic \n 1 teaspoon of dried chili flakes \n 2 small eggplant \n 1 teaspoon of salt \n 1/2 teaspoon of black pepper"
                    break
                case 4:
                    ingredients = " 250 g carrots \n 1 onion \n 1 beef tomato \n Half of the peel of a fresh orange \n 1 liter of water \n 250ml Sugar-free Soy Milk "
                    break
                case 5:
                    ingredients = " 1 beefsteak tomato \n 2 Portobello mushrooms \n 4 pieces hamburger buns \n 2 pieces cheese (can be omitted) \n 1/4 Iceberg lettuce "
                    break
                case 6:
                    ingredients = " 1 cup of broccoli pieces \n 1⁄2 cup quinoa (cooked) \n 1 egg \n 2 slices of tomato \n Rocket salad \n Vegan cheese "
                    break
                case 7:
                    ingredients = " 1 cup of rice \n 2 tomatoes (Cut into pieces) \n 6 ears of corn (Cut into pieces) \n 1 bell pepper (Cut into pieces) (in different colors) \n a little water "
                    break
                default:
                    break
                }
                
                //steps database
                var steps = String()
                switch pressedRow {
                case 0:
                    steps = "Step 1: Crush the tofu by hand in a large bowl. \n\nStep 2: Use medium to large heat to heat up the cooking pan, add coconut oil and spices, and stir-fry them well with the tofu. Add some salt and pepper for seasoning. \n\nStep 3: Prepare another cooking pan and heat it up, stir-fry the mushrooms and spinach and season it with salt and black pepper. And eventually serve it with a toast on a plate."
                    break
                case 1:
                    steps = "Step 1: Turn on low heat and brush some oil on the pan. Place the French horn mushrooms on the pan with covered lid for 5 minutes. \n\nStep 2: Remove the lid and flip the mushrooms, and cook it with covered lid for another 5 minutes. \n\nStep3: Add the sauce and cover with lid and cook for 5-7 minutes until the sauce dries up slightly and thickens a bit. "
                    break
                case 2:
                    steps = "Step 1: Put some olive oil, heat up the pan with a small fire. Put the white gourd into the pan and keep stirring until the gourd starting to soften. Put the rest of the materials and stir fry for 5 minutes. \n\nStep 2: Place appropriate amount of stuffing in the center of the dumpling wrapping, and stain some water for wrapping the things into dumplings. Finally, fry the dumplings until its color turning into golden brown."
                    break
                case 3:
                    steps = "Step 1: Boil up water and add some salt in it. Put in spaghetti and cook it thoroughly. Pick them up when the spaghetti is fully cooked. \n\nStep 2: Slice the garlic and cut the small eggplant into four pieces. Heat up the pan and add some oil, put in the garlic slices and chilli flakes and leave them for about 5 seconds. \n\nStep 3: Add the eggplant, salt and black pepper, stir-fry it until the smell comes up."
                    break
                case 4:
                    steps = "Step 1: Add olive oil, ginger, garlic, and onions into the pan and stir-fry them with high heat. Then, add the carrots and tomato and stir-fry them for 1 minute. Add some water and bay leaves, and wait until it boils. \n\nStep 2: Turn the fire to medium heat and cook for 15 minutes. Turn on the heat. Add the sugar-free soy milk and orange peel, simmer for about 3 minutes on medium heat. Season it with salt and black pepper."
                    break
                case 5:
                    steps = "Step 1: Make a salsa sauce with the flesh of the tomato, chopped onions and a little bit of fresh chili, and mix them well.  Put some salt into the pan and saute the mushroom for 3-5 minutes for each side. \n\nStep 2: Add the salsa and cheese on top, and season it with olive oil, salt and black pepper. \n\nStep 3: Heat up two hamburger buns, put on lettuce, tomato, and salsa on it."
                    break
                case 6:
                    steps = "Step 1: Preheat the oven at 200°C. Finely chop the broccoli and blend them. Put the broccoli and cooked quinoa into a bowl, mix them with the egg, thyme, salt and black pepper. \n\nStep 2: Spread the quinoa mixture on the tray. Use a spoon to flatten the mixture into a pizza shape. And bake it for 12 minutes.  \n\nStep 3: Take out the pizza from the oven.  Garnish the pizza with basil and rocket salad."
                    break
                case 7:
                    steps = "Step 1: Cook the rinsed rice, add water until the water level reaches 1 cm above the rice. Add one teaspoon of ground turmeric powder, and cover with lid and cook over medium heat. \n\nStep 2: Stir the rice so that it will not stick to the pot. Remove the lid and add the corn on top. Cover the lid and cook over low heat.\n\nStep 3: Open the lid and add the bell pepper and tomatoes. Cover and cook for 10 minutes."
                    break
                default:
                    break
                }
                
                destinationVC.segueData = (toPresent[pressedRow],
                                           toPresent[pressedRow]+".jpg",
                                           ingredients,
                                           steps,
                                           pressedRow)
            }
        }
    }
    

}
