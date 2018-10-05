import UIKit

class GenericTableViewController<T: GenericTableViewCell<C>, C>: UITableViewController {
    
    var items = [C]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(T.self, forCellReuseIdentifier: "Cell")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GenericTableViewCell<C>
        cell.item = items[indexPath.row]
        return cell
    }
}

class GenericTableViewCell<C>: UITableViewCell {
    
    var item: C!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

struct User {
    let name: String
}

class UserCell: GenericTableViewCell<User> {
    override var item: User! {
        didSet {
            textLabel?.text = item.name
        }
    }
}

class ViewController: GenericTableViewController<UserCell, User> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [User(name: "Ania"), User(name: "Marcin")]

    }
}
