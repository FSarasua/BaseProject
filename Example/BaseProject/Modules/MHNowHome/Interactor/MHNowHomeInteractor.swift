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
    var presenter: MHNowHomePresenterOutput? = nil
    
    // MARK: Manager
    let urlSessionManager = URLSessionManager.shared
}

protocol MHNowHomeInteractorInput {
    func requestData()
}

extension MHNowHomeInteractor: MHNowHomeInteractorInput {
    func requestData() {
        /* Request data and transfer the data obteined */
        presenter?.loadData()
    }
}
