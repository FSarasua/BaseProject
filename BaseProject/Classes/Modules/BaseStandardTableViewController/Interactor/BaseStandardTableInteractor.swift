//
//  BaseStandardTableInteractor.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

class BaseStandardTableInteractor {
    // MARK: Viper
    var presenter: BaseStandardTablePresenterOutput? = nil
    
    // MARK: Manager
    let urlSessionManager = URLSessionManager.shared
    let validationManager = ValidationManager.shared
}

protocol BaseStandardTableInteractorInput {
    func requestData()
}

extension BaseStandardTableInteractor: BaseStandardTableInteractorInput {
    func requestData() {
        let model = BaseStandardTableDataRepository.shared.getBaseStandardTableViewModel()
        
        self.presenter?.loadData(model)
    }
}
