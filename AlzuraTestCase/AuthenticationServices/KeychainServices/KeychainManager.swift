//
//  KeychainManager.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 19.08.2022.
//

import UIKit
import Locksmith

class KeychainManager {
    
    func saveData(dataToSave: [String: Any], userAccountName: String, completion: @escaping (AuthCompletionHandler) -> Void) {
        do {
            try Locksmith.saveData(data: dataToSave, forUserAccount: userAccountName)
            completion(.success(user: nil))
        } catch let dataSavingError {
            completion(.failure(errorDescription: dataSavingError.localizedDescription))
            print(dataSavingError.localizedDescription)
        }
    }
    
    func updateData(dataToUpdate: [String: Any], userAccountName: String) {
        do {
            try Locksmith.updateData(data: dataToUpdate, forUserAccount: userAccountName)
        } catch let dataUpdateError {
            print(dataUpdateError.localizedDescription)
        }
    }
    
    func getData(userAccountName: String) -> [String: Any]? {
          let dictonary = Locksmith.loadDataForUserAccount(userAccount: userAccountName)
          return dictonary
    }

}
