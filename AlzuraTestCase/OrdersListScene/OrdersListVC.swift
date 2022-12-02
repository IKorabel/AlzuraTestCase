//
//  OrderListVC.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 17.08.2022.
//

import UIKit

class OrdersListVC: UIViewController {
    
    lazy private var ordersListTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(OrderTableViewCell.nibIdentifier, forCellReuseIdentifier: OrderTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    private lazy var loadingSpinner: UIActivityIndicatorView = {
        let loadingSpinner = UIActivityIndicatorView(style: .medium)
        loadingSpinner.startAnimating()
        loadingSpinner.hidesWhenStopped = true
        return loadingSpinner
    }()
    
    private lazy var signOutBarButtonItem: UIBarButtonItem = {
        let signOutButton = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: #selector(didClickedOnSignOutButton(_:)))
        return signOutButton
    }()
    
    private lazy var sortBarButtonItem: UIBarButtonItem = {
        let sortButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down")!, style: .done, target: self, action: #selector(didClickedOnSortButton(_:)))
        return sortButton
    }()
    

    let ordersSearchController = UISearchController()
    
    var orders = [Order]()
    var filteredOrders = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        fetchOrders()
        // Do any additional setup after loading the view.
    }
    
    private func commonInit() {
       implementSearchController()
       presentOrdersList()
       addButtonsToNavigationBar()
       title = "Orders List"
    }
    
    private func implementSearchController() {
        self.filteredOrders = orders
        ordersSearchController.searchBar.delegate = self
        ordersSearchController.searchBar.placeholder = "Search by ID"
        navigationItem.searchController = ordersSearchController
    }
    
    func fetchOrders() {
        ordersListTableView.backgroundView = loadingSpinner
    }
    
    private func addButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [signOutBarButtonItem]
        navigationItem.rightBarButtonItems = [sortBarButtonItem]
    }
    
    
    private func presentOrdersList() {
        view.addSubview(ordersListTableView)
        NSLayoutConstraint.activate([
            ordersListTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ordersListTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            ordersListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            ordersListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: Actions
extension OrdersListVC {
    
    @objc private func didClickedOnSignOutButton(_ sender: UIBarButtonItem) {
        AuthenticationManager().signOut {
            SegueHelper.toLoginPage.makeSegue(fromVC: self)
        }
    }
    
    @objc private func didClickedOnSortButton(_ sender: UIBarButtonItem) {
        let sortInDescendingOrderButton = UIAlertAction(title: "By descending order", style: .default) { [self] _ in
            print("descending order")
          //  ordersSearchController.searchBar.isHidden = true
            filteredOrders = orders.sortOrders(comparisonResult: .orderedDescending)
            ordersListTableView.reloadData()
        }
        
        let sortInAscendingOrderButton = UIAlertAction(title: "By ascending order", style: .default) { [self] _ in
            print("acending order")
          //  ordersSearchController.searchBar.isHidden = true
            filteredOrders = orders.sortOrders(comparisonResult: .orderedAscending)
            ordersListTableView.reloadData()
        }
        
        let exitButton = UIAlertAction(title: "Cancel", style: .destructive)
        
        AlertManager.createMenuAlert(vc: self, title: "How do you want to sort?", actions: [sortInDescendingOrderButton, sortInAscendingOrderButton, exitButton]) { [self] in }
    }
}

extension OrdersListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orderCell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.reuseIdentifier) as? OrderTableViewCell else {
            print("not active")
            return UITableViewCell()
        }
        let order = filteredOrders[indexPath.row]
        orderCell.setOrder(order: order)
        return orderCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return OrdersListSettings.shared.sortingOrder.text
    }
    
}

extension OrdersListVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredOrders = []
        
        if searchText.isEmpty {
            filteredOrders = orders
        }
        
        orders.forEach { filteredOrder in
            let orderID = "\(filteredOrder.id)"
            if orderID.uppercased().contains(searchText.uppercased()) {
                filteredOrders.append(filteredOrder)
            }
        }
        ordersListTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredOrders = orders
        ordersListTableView.reloadData()
    }
}
