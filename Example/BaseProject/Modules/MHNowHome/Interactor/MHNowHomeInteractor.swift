//
//  MHNowHomeInteractor.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 23/9/23
//

import Foundation
import BaseProject

class MHNowHomeInteractor {
    // MARK: Viper
    var presenter: MHNowHomePresenter? = nil
    
    // MARK: Manager
    let urlSessionManager = URLSessionManager.shared
    let validationManager = ValidationManager.shared
}

protocol MHNowHomeInteractorInput {
    func requestData()
}

extension MHNowHomeInteractor: MHNowHomeInteractorInput {
    func requestData() {
        let model = MHNowHomeDataRepository.shared.getMHNowHomeViewModel()
        
        self.presenter?.loadData(model)
    }
}