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
    
    // MARK: Public
}

// MARK: Private
private extension MHNowHomePresenter {
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

protocol MHNowHomePresenterInput {
    func requestData()
    func viewWillAppear()
    func viewWillDissapear()
    // MARK: View Model
    func getNavigationTitle() -> String
    func getBackgroundImageName() -> String
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
    
    func getBackgroundImageName() -> String {
        return viewModel.nameImgBackground
    }
}

protocol MHNowHomePresenterOutput {
    func loadData()
}

extension MHNowHomePresenter: MHNowHomePresenterOutput {
    func loadData() {
        view?.stopLoading()
    }
}
