import Foundation
import UIKit
import FanMenu
import Macaw

class HomeViewController: UIViewController {
    
    @IBOutlet weak var fanMenu: FanMenu!
    //@IBOutlet weak var tableView: UITableView!
    
    
    let items = [
        ("about", 0x85B1FF),
        ("camera", 0x9F85FF),
        ("recipe", 0xFF703B),
        ("forum", 0xF55B58),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fanMenu.button = FanMenuButton(
            id: "main",
            image: UIImage(named: "menu_plus"),
            color: Color(val: 0x7C93FE)
        )
        
        fanMenu.items = items.map { button in
            FanMenuButton(
                id: button.0,
                image: UIImage(named: "menu_\(button.0)"),
                color: Color(val: button.1)
            )
        }
        
        fanMenu.menuRadius = 90.0
        fanMenu.duration = 0.2
        fanMenu.delay = 0.05
        fanMenu.interval = (Double.pi, 2 * Double.pi)

        fanMenu.onItemDidClick = { button in
            //print("ItemDidClick: \(button.id)")
            switch button.id {
            case "about":
                self.performSegue(withIdentifier: "segue_about", sender: self)
                break
            case "camera":
                self.performSegue(withIdentifier: "segue_camera", sender: self)
                break
            case "recipe":
                self.performSegue(withIdentifier: "segue_recipe", sender: self)
                break
            case "forum":
                self.performSegue(withIdentifier: "segue_forum", sender: self)
                break
            default:
                break
            }
        }

        fanMenu.onItemWillClick = { button in
            //print("ItemWillClick: \(button.id)")
        }
        
        fanMenu.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        fanMenu.updateNode()
    }
    
    

}

