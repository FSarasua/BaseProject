//
//  MHNowHomePresenter.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 23/9/23
//

import Foundation
import UIKit
import BaseProject

class MHNowHomePresenter {
    // MARK: Viper
    var view: MHNowHomeView? = nil
    var router: Router? = nil
    var interactor: MHNowHomeInteractor? = nil
    
    // MARK: Data
    var viewModel = MHNowHomeViewModel()
    
    // MARK: Manager
    let alertManager = AlertManager.shared
    
    func addActiveObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(notifyMethod(_:)), name: .activeObserver, object: nil)
    }
    
    func removeActiveObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}

private extension MHNowHomePresenter {
    @objc func notifyMethod(_ notification: Notification) {
        guard let methodName = notification.userInfo?[KConstants.methodName] as? MethodName else { return }
        switch methodName {
        case .presentView:
            guard let controller = notification.userInfo?[KConstants.param1] as? UIViewController else { return }
            present(controller)
        case .pushView:
            guard let controller = notification.userInfo?[KConstants.param1] as? UIViewController else { return }
            pushTo(controller)
        default: break
        }
    }
    
    func pushTo(_ controller: UIViewController) {
        self.router?.push(controller)
    }
    
    func present(_ controller: UIViewController) {
        self.router?.present(controller)
    }
}

protocol MHNowHomePresenterInput {
    func requestData()
    func viewWillAppear()
    func viewWillDissapear()
    func getNavigationTitle() -> String 
}

extension MHNowHomePresenter: MHNowHomePresenterInput {
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
    
    // MARK: View Model
    func getNavigationTitle() -> String {
        return viewModel.navigationTitle
    }
}

protocol MHNowHomePresenterOutput {
    func loadData(_ model: MHNowHomeViewModel)
}

extension MHNowHomePresenter: MHNowHomePresenterOutput {
    func loadData(_ model: MHNowHomeViewModel) {
        viewModel = model
        view?.loadData()
        view?.stopLoading()
    }
}
