//
//  BaseStandardTablePresenter.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation
import UIKit

class BaseStandardTablePresenter {
    // MARK: Viper
    var view: BaseStandardTableView? = nil
    var router: Router? = nil
    var interactor: BaseStandardTableInteractor? = nil
    
    // MARK: Data
    var viewModel = BaseStandardTableViewModel()
    
    // MARK: Manager
    let alertManager = AlertManager.shared
    
    // MARK: Public
}

// MARK: Private
private extension BaseStandardTablePresenter {
    // MARK: Private Notifications
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
        case .pushView:
            guard let controller = notification.userInfo?[KConstants.param1] as? UIViewController else { return }
            push(controller)
        case .didSelectRowAt:
            guard let model = notification.userInfo?[KConstants.param1] as? BaseCellModel,
                  let cell = notification.userInfo?[KConstants.param2] as? UITableViewCell else { return }
            break
        default: break
        }
    }
    
    func push(_ controller: UIViewController) {
        router?.push(controller)
    }
    
    func present(_ controller: UIViewController) {
        router?.present(controller)
    }
}

protocol BaseStandardTablePresenterInput {
    func requestData()
    func viewWillAppear()
    func viewWillDissapear()
    // MARK: - View Model
    func getNavigationTitle() -> String
    func getDelegate() -> CustomTableViewDataSource<BaseCellModel>
    func getDataSource() ->  CustomTableViewDataSource<BaseCellModel>
}

extension BaseStandardTablePresenter: BaseStandardTablePresenterInput {
    func requestData() {
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
    
    func getDataSource() ->  CustomTableViewDataSource<BaseCellModel> {
        return viewModel.customDataSource
    }
}

protocol BaseStandardTablePresenterOutput {
    func loadData(models: [[BaseCellModel]])
}

extension BaseStandardTablePresenter: BaseStandardTablePresenterOutput {
    func loadData(models: [[BaseCellModel]]) {
        viewModel.customDataSource.models = models
        view?.reloadTableViewData()
        view?.stopLoading()
    }
}
