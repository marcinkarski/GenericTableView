import UIKit

class BaseTableViewSearchController<T: BaseTableViewCell<V>, V>: UITableViewController, UISearchBarDelegate where V: Searchable {
    
    private var strongDataSource: GenericTableViewDataSource<T, V>?
    private let searchController = UISearchController(searchResultsController: nil)
    
    var filteredModels: [V] = []
    
    var models: [V] = [] {
        didSet {
            DispatchQueue.main.async {
                self.strongDataSource = GenericTableViewDataSource(models: self.models, configureCell: { cell, model in
                    cell.item = model
                    return cell
                })
                self.tableView.dataSource = self.strongDataSource
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self)
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
//        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.sizeToFit()
        searchController.searchBar.delegate = self
        definesPresentationContext = true
    }
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        strongDataSource?.search(query: searchText)
        self.tableView.reloadData()
    }
}
