//
//  BaseClassesTableInteractor.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 14/9/23
//

import Foundation
import BaseProject

class BaseClassesTableInteractor {
    // MARK: Viper
    var presenter: BaseClassesTablePresenter? = nil
    
    // MARK: Manager
    let urlSessionManager = URLSessionManager.shared
    let validationManager = ValidationManager.shared
}

protocol BaseClassesTableInteractorInput {
    func requestData()
}

extension BaseClassesTableInteractor: BaseClassesTableInteractorInput {
    func requestData() {
        var model = BaseClassesTableViewModel()
        
        model = BaseClassesTableDataRepository.shared.getBaseClassesTableViewModel()
        
        self.presenter?.loadData(model)
    }
}
