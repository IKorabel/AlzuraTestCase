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
    
    private lazy var signOutBarButtonItem: UIBarButtonItem = {
        let signOutButton = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: #selector(didClickedOnSignOutButton(_:)))
        return signOutButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         presentOrdersList()
         addButtonsToNavigationBar()
        title = "Orders List"
        // Do any additional setup after loading the view.
    }
    
    private func addButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [signOutBarButtonItem]
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
}

extension OrdersListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orderCell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.reuseIdentifier) as? OrderTableViewCell else {
            print("not active")
            return UITableViewCell()
        }
        return orderCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "ALALAl"
    }
    
}
