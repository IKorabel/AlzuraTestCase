//
//  OrdersListModuleOrdersListModuleInteractor.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30/11/2022.
//  Copyright © 2022 Igor Shefer Inc. All rights reserved.
//
import Foundation

class OrdersListModuleInteractor: OrdersListModuleInteractorInput {

    var output: OrdersListModuleInteractorOutput?
    
    func fetchOrders() {
        let alzuraApiManager = AlzuraAPIManager()
        alzuraApiManager.makeRequest(whatToGet: .getOrders, returningObjectType: [Order].self) { [self] apiRequestCompletionHandler in
            switch apiRequestCompletionHandler {
            case .success(let success):
                print("ObtainedData: \(success)")
                output?.interactorDidFetchOrdersWithSuccess(orders: success)
            case .failure(let failure):
                output?.interactorDidFetchOrdersWithFailure(failure: failure)
            }
        }
        
    }

}
