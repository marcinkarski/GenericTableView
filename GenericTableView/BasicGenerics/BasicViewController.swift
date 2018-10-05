import UIKit

class BasicViewController: GenericTableViewController<PersonCell, Person> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items = [Person(name: "Ania"), Person(name: "Marcin")]
    }
}
