//
//  BaseStandardPresenter.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation
import UIKit

class BaseStandardPresenter {
    var view: BaseStandardView? = nil
    var router: BaseStandardRouter? = nil
    var interactor: BaseStandardInteractor? = nil
    
    // MARK: Manager
    let alertManager = AlertManager.shared
}

protocol BaseStandardPresenterInput {
    func requestData()
}

extension BaseStandardPresenter: BaseStandardPresenterInput {
    func requestData() {
        self.interactor?.requestData()
    }
}

protocol BaseStandardPresenterOutput {
    func loadData(_ model: BaseStandardViewModel)
}

extension BaseStandardPresenter: BaseStandardPresenterOutput {
    func loadData(_ model: BaseStandardViewModel) {
        view?.loadData(model)
        view?.stopLoading()
    }
}

protocol BaseStandardCellAction: CellAction {
    
}

extension BaseStandardPresenter: BaseStandardCellAction {
    
}
    
