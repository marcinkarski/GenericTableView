import UIKit

class ViewController: UIViewController {
    
    private var isViewControllerInitialized = false
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Generic TableView"
        
        view.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        guard !self.isViewControllerInitialized else {
            return
        }
        self.isViewControllerInitialized = true
//        self.navigationController?.pushViewController(BasicViewController(), animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        self.configureTableCell(cell, at: indexPath)
        return cell
    }
    
    private func configureTableCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Basic"
        case 1:
            cell.textLabel?.text = "Advanced with SearchBar"

        default:
            break
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(BasicViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(AdvancedViewController(), animated: true)

        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
