//
//  OrdersListModuleOrdersListModulePresenter.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30/11/2022.
//  Copyright © 2022 Igor Shefer Inc. All rights reserved.
//

class OrdersListModulePresenter: OrdersListModuleModuleInput, OrdersListModuleViewOutput, OrdersListModuleInteractorOutput {
    
    weak var view: OrdersListModuleViewInput!
    var interactor: OrdersListModuleInteractorInput
    var router: OrdersListModuleRouterInput

    required init(view: OrdersListModuleViewInput,
         	  interactor: OrdersListModuleInteractorInput,
	          router: OrdersListModuleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router   
    }

    func viewIsReady() {

    }
    
    func interactorDidFetchOrdersWithSuccess(orders: [Order]) {
    }
    
    func interactorDidFetchOrdersWithFailure(failure: APIResponseCompletionHandlerError) {
    }
}
