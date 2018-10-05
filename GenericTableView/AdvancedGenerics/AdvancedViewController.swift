import UIKit

class AdvancedViewController: BaseTableViewSearchController<UserCell, User> {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let users = [User(name: "Messi"), User(name: "Ronaldo"), User(name: "Modric"), User(name: "Guerrero"), User(name: "Rodriguez"), User(name: "Kane"), User(name: "Ramos"), User(name: "Pique"), User(name: "Mbape"), User(name: "Pogba"), User(name: "Zidane"), User(name: "Kross"), User(name: "Puyol"), User(name: "Beckham")]
        
        self.models = users
    }
}

