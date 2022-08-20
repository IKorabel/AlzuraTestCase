//
//  AlertManager.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 20.08.2022.
//

import UIKit

class AlertManager {
    
    static func createErrorAlert(vc: UIViewController,errorTheme: String, errorDescription: String) {
        let errorAlertController = UIAlertController(title: errorTheme, message: errorDescription, preferredStyle: .alert)
        let errorAlertDismissAction = UIAlertAction(title: "OK", style: .cancel)
        errorAlertController.addAction(errorAlertDismissAction)
        vc.present(errorAlertController, animated: true)
    }
    
    static func createMenuAlert(vc: UIViewController, title: String, actions: [UIAlertAction], completion: (() -> Void)?) {
        let menuAlert = UIAlertController(title: title, message: "Please select a sorting method", preferredStyle: .actionSheet)
        actions.forEach({ menuAlert.addAction($0)})
        vc.present(menuAlert, animated: true, completion: completion)
    }
}
