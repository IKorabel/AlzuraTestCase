//
//  OrdersListModuleOrdersListModuleViewController.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30/11/2022.
//  Copyright © 2022 Igor Shefer Inc. All rights reserved.
//

import UIKit

class OrdersListModuleViewController: UIViewController, OrdersListModuleViewInput {

    var output: OrdersListModuleViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: OrdersListModuleViewInput
    func setupInitialState() {
    }
}
