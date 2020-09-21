import UIKit

class MainViewController: UITableViewController
{
    
    @IBOutlet var headerView : UIView!
    @IBOutlet weak var newItemTextField: UITextField!
    
    var activeItems : [Item] = []
    var doneItems : [Item] = []
}
