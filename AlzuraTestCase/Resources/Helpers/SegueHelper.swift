//
//  SegueHelper.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import UIKit

enum SegueHelper {
   case toOrders
   case toLoginPage
    
    var destinationVC: UINavigationController {
        switch self {
        case .toOrders:
            return SceneDelegate.ordersNavigationController
        case .toLoginPage:
            return SceneDelegate.authNavigationController
        }
    }
    
    func makeSegue(fromVC: UIViewController) {
        let destinationVC = destinationVC
        destinationVC.modalTransitionStyle = .flipHorizontal
        destinationVC.modalPresentationStyle = .fullScreen
        fromVC.present(destinationVC, animated: true)
    }
}
