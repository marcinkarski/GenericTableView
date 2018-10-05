import Foundation

class UserCell: BaseTableViewCell<User> {
    
    override var item: User? {
        didSet {
            textLabel?.text = item?.name
        }
    }
}
