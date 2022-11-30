//
//  OrdersListModuleOrdersListModuleModuleInput.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30/11/2022.
//  Copyright © 2022 Igor Shefer Inc. All rights reserved.
//

protocol OrdersListModuleModuleInput: AnyObject {
	var view: OrdersListModuleViewInput! { get set }
	var interactor: OrdersListModuleInteractorInput { get set }
	var router: OrdersListModuleRouterInput { get set }

	init(view: OrdersListModuleViewInput, interactor: OrdersListModuleInteractorInput, router: OrdersListModuleRouterInput)
}
