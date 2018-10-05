import Foundation

struct User: Searchable {
    
    var query: String {
        return name
    }
    
    let name: String
}
