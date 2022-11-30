//
//  OrdersListModuleOrdersListModuleInteractorOutput.swift
//  AlzuraTestCase
//
//  Created by Igor Shefer on 30/11/2022.
//  Copyright © 2022 Igor Shefer Inc. All rights reserved.
//

import Foundation

protocol OrdersListModuleInteractorOutput: AnyObject {
    func interactorDidFetchOrdersWithSuccess(orders: [Order])
    func interactorDidFetchOrdersWithFailure(failure: APIResponseCompletionHandlerError)
}
