import Foundation
import UIKit
import FanMenu
import Macaw

class HomeViewController: UIViewController {
    
    @IBOutlet weak var fanMenu: FanMenu!
    //@IBOutlet weak var tableView: UITableView!
    
    
    let items = [
        ("camera", 0x9F85FF),
        ("wallet", 0x85B1FF),
        ("money_box", 0xFF703B),
        ("visa", 0xF55B58),
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
            print("ItemDidClick: \(button.id)")
        }

        fanMenu.onItemWillClick = { button in
            print("ItemWillClick: \(button.id)")
        }
        
        fanMenu.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        fanMenu.updateNode()
    }
    
    

}

/*
class TransactionCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var transactionImage: UIImageView!
}
*/
