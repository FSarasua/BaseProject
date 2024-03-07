//
//  BaseStandardInteractor.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

class BaseStandardInteractor {
    // MARK: Viper
    var presenter: BaseStandardPresenterOutput? = nil
    
    // MARK: Manager
    let urlSessionManager = URLSessionManager.shared
    let validationManager = ValidationManager.shared
}

protocol BaseStandardInteractorInput {
    func requestData()
}

extension BaseStandardInteractor: BaseStandardInteractorInput {
    func requestData() {
        /* Request data and transfer the data obteined */
        presenter?.loadData()
    }
}
