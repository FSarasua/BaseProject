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

private extension BaseStandardPresenter {
    func addActiveObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(notifyMethod(_:)), name: .activeObserver, object: nil)
    }
    
    func removeActiveObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func notifyMethod(_ notification: Notification) {
        guard let methodName = notification.userInfo?[KConstants.methodName] as? MethodName else { return }
        switch methodName {
        case .presentView:
            guard let controller = notification.userInfo?[KConstants.param1] as? UIViewController else { return }
            present(controller)
            break
        case .pushView:
            guard let controller = notification.userInfo?[KConstants.param1] as? UIViewController else { return }
            push(controller)
            break
        case .didSelectRowAt:
            guard let model = notification.userInfo?[KConstants.param1] as? BaseCellModel,
                  let cell = notification.userInfo?[KConstants.param2] as? UITableViewCell else { return }
            break
        default:
            break
        }
    }
    
    func push(_ viewController: UIViewController) {
        self.router?.push(viewController)
    }
    
    func present(_ controller: UIViewController) {
        self.router?.present(controller)
    }
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
