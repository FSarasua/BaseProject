//
//  BaseClassesTablePresenter.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 14/9/23
//

import Foundation
import UIKit
import BaseProject

class BaseClassesTablePresenter {
    var view: BaseClassesTableView? = nil
    var router: BaseClassesTableRouter? = nil
    var interactor: BaseClassesTableInteractor? = nil
    
    // MARK: Manager
    let alertManager = AlertManager.shared
    
    func addActiveObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(selectMethod(_:)), name: .activeObserver, object: nil)
    }
    
    func removeActiveObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}

private extension BaseClassesTablePresenter {
    @objc func selectMethod(_ notification: Notification) {
        guard let methodName = notification.userInfo?["NAME"] as? MethodName else { return }
        
        switch methodName {
        case .presentView:
            guard let controller = notification.userInfo?["PARAM1"] as? UIViewController else { return }
            present(controller)
            break
        case .pushView:
            let viewController = getViewController(with: notification.userInfo)
            pushTo(viewController)
            break
        default: break
        }
    }
    
    func getViewController(with userInfo: [AnyHashable : Any]?) -> UIViewController {
        guard let module = userInfo?["PARAM1"] as? Module else {
            /* TODO: - Español: Implementar alert, módulo no encontrado. English: Implement alert, module not found. */
            return UIViewController()
        }
        return module.instance
    }
    
    func pushTo(_ viewController: UIViewController) {
        self.router?.open(viewController)
    }
    
    func present(_ controller: UIViewController) {
        self.router?.present(controller)
    }
}

protocol BaseClassesTablePresenterInput {
    func requestData()
    func viewWillAppear()
    func viewWillDissapear()
}

extension BaseClassesTablePresenter: BaseClassesTablePresenterInput {
    func requestData() {
        view?.startLoading()
        interactor?.requestData()
    }
    
    func viewWillAppear() {
        addActiveObserver()
    }
    
    func viewWillDissapear() {
        removeActiveObserver()
    }
}

protocol BaseClassesTablePresenterOutput {
    func loadData(_ model: BaseClassesTableViewModel)
}

extension BaseClassesTablePresenter: BaseClassesTablePresenterOutput {
    func loadData(_ model: BaseClassesTableViewModel) {
        view?.loadData(model)
        view?.reloadTableViewData()
        view?.stopLoading()
    }
}
