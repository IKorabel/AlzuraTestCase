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

}
