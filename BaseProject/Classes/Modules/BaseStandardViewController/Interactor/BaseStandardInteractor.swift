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
        let model = BaseStandardDataRepository.shared.getBaseStandardViewModel()
        
        self.presenter?.loadData(model)
    }
}
