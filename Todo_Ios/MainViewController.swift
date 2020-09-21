import UIKit

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AppData.initialize()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return AppData.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellId", for: indexPath)
        
        let thisItem = AppData.items[indexPath.row]
                
        let attrString = NSMutableAttributedString(string: thisItem.description)
        
        if thisItem.done
        {
            attrString.addAttribute(.strikethroughStyle, value:2.0, range: NSMakeRange(0, attrString.length))
            cell.backgroundColor = .lightGray
            cell.accessoryType = .checkmark
        }
        else
        {
            attrString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attrString.length))
            cell.backgroundColor = .white
            cell.accessoryType = .none
        }
        
        cell.textLabel?.attributedText = attrString
        
        return cell
    }
}
