//
//  OrdersListModuleOrdersListModuleConfigurator.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30/11/2022.
//  Copyright © 2022 Igor Shefer Inc. All rights reserved.
//

import UIKit

class OrdersListModuleModuleConfigurator {


    static func configureModule() -> UIViewController {
	let view = OrdersListModuleViewController()
	let interactor = OrdersListModuleInteractor()
	let router = OrdersListModuleRouter()
	let presenter = OrdersListModulePresenter(view: view, interactor: interactor, router: router)

	interactor.output = presenter
        view.output = presenter
        
        router.rootVC = view
        return view
	}
}
