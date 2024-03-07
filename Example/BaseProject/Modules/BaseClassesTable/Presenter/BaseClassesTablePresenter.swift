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
    var router: Router? = nil
    var interactor: BaseClassesTableInteractor? = nil
    
    // MARK: Data
    var viewModel = BaseClassesTableViewModel()
    
    // MARK: Manager
    let alertManager = AlertManager.shared
}

private extension BaseClassesTablePresenter {
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

protocol BaseClassesTablePresenterInput {
    func requestData()
    func viewWillAppear()
    func viewWillDissapear()
    
    // MARK: - View Model
    func getNavigationTitle() -> String
    func getDelegate() -> CustomTableViewDataSource<BaseCellModel>
    func getDataSource() -> CustomTableViewDataSource<BaseCellModel>
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
    
    // MARK: - View Model
    func getNavigationTitle() -> String {
        return viewModel.navigationTitle
    }
    
    func getDelegate() -> CustomTableViewDataSource<BaseCellModel> {
        return viewModel.customDataSource
    }
    
    func getDataSource() -> CustomTableViewDataSource<BaseCellModel> {
        return viewModel.customDataSource
    }
}

protocol BaseClassesTablePresenterOutput {
    func loadData(models: [BaseCellModel])
}

extension BaseClassesTablePresenter: BaseClassesTablePresenterOutput {
    func loadData(models: [BaseCellModel]) {
        viewModel.customDataSource.models = models
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            view?.reloadTableViewData()
            view?.stopLoading()
        }
    }
}
