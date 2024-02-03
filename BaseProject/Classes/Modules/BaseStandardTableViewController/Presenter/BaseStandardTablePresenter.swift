//
//  BaseStandardTablePresenter.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation
import UIKit

class BaseStandardTablePresenter {
    var view: BaseStandardTableView? = nil
    var router: BaseStandardTableRouter? = nil
    var interactor: BaseStandardTableInteractor? = nil
    
    // MARK: Manager
    let alertManager = AlertManager.shared
    
    func addActiveObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(selectMethod(_:)), name: .activeObserver, object: nil)
    }
    
    func removeActiveObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}

private extension BaseStandardTablePresenter {
    @objc func selectMethod(_ notification: Notification) {
        guard let methodName = notification.userInfo?["NAME"] as? CellActionName else { return }
        
        switch methodName {
        case .presentView:
            guard let controller = notification.userInfo?["PARAM1"] as? UIViewController else { return }
            present(controller)
        case .pushView:
            guard let module = notification.userInfo?["PARAM1"] as? Module else { return }
            pushTo(module)
        default: break
        }
    }
    
    func pushTo(_ module: Module) {
        let instance = module.instance
        self.router?.open(instance)
    }
    
    func present(_ controller: UIViewController) {
        self.router?.present(controller)
    }
}

protocol BaseStandardTablePresenterInput {
    func requestData()
    func viewWillAppear()
    func viewWillDissapear()
}

extension BaseStandardTablePresenter: BaseStandardTablePresenterInput {
    func requestData() {
        self.interactor?.requestData()
    }
    
    func viewWillAppear() {
        addActiveObserver()
    }
    
    func viewWillDissapear() {
        removeActiveObserver()
    }
}

protocol BaseStandardTablePresenterOutput {
    func loadData(_ model: BaseStandardTableViewModel)
}

extension BaseStandardTablePresenter: BaseStandardTablePresenterOutput {
    func loadData(_ model: BaseStandardTableViewModel) {
        view?.loadData(model)
        view?.reloadTableViewData()
        view?.stopLoading()
    }
}
