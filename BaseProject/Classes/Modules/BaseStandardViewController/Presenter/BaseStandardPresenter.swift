//
//  BaseStandardPresenter.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation
import UIKit

class BaseStandardPresenter {
    // MARK: Viper
    var view: BaseStandardView? = nil
    var router: Router? = nil
    var interactor: BaseStandardInteractor? = nil
    
    // MARK: Data
    var viewModel = BaseStandardViewModel()
    
    // MARK: Manager
    let alertManager = AlertManager.shared
}

protocol BaseStandardPresenterInput {
    func requestData()
    func getNavigationTitle() -> String
}

extension BaseStandardPresenter: BaseStandardPresenterInput {
    func requestData() {
        view?.startLoading()
        interactor?.requestData()
    }
    
    func getNavigationTitle() -> String {
        return viewModel.navigationTitle
    }
}

protocol BaseStandardPresenterOutput {
    func loadData()
}

extension BaseStandardPresenter: BaseStandardPresenterOutput {
    func loadData() {
        view?.stopLoading()
    }
}
