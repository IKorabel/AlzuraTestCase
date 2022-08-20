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
        let sceneDelegate = SceneDelegate()
        switch self {
        case .toOrders:
            return sceneDelegate.ordersNavigationController
        case .toLoginPage:
            return sceneDelegate.authNavigationController
        }
    }
    
    func makeSegue(fromVC: UIViewController) {
        let destinationVC = destinationVC
        destinationVC.modalTransitionStyle = .flipHorizontal
        destinationVC.modalPresentationStyle = .fullScreen
        fromVC.present(destinationVC, animated: true)
    }
}
