import Foundation

class PersonCell: GenericTableViewCell<Person> {
    override var item: Person? {
        didSet {
            textLabel?.text = item?.name
        }
    }
}
