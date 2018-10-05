import UIKit

class GenericTableViewController<T: UITableViewCell>: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(T.self, forCellReuseIdentifier: "Cell")
        
    }
}

class ViewController: GenericTableViewController<UITableViewCell> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
