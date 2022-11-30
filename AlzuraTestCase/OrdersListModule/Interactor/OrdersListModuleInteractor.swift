//
//  OrdersListModuleOrdersListModuleInteractor.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30/11/2022.
//  Copyright © 2022 Igor Shefer Inc. All rights reserved.
//

class OrdersListModuleInteractor: OrdersListModuleInteractorInput {

    weak var output: OrdersListModuleInteractorOutput!
    
    func fetchOrders() {
        let alzuraApiManager = AlzuraAPIManager()
        alzuraApiManager.fetchOrders { ordersFetchResult in
            switch ordersFetchResult {
            case .success(let data):
                print("Obtained Data")
                output?.interactorDidFetchOrdersWithSuccess(orders: [])
            case .failure(let error):
                output?.interactorDidFetchOrdersWithFailure(failure: error)
            }
        }
    }

}
