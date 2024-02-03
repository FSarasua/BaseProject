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
    var view: MHNowHomeView? = nil
    var router: MHNowHomeRouter? = nil
    var interactor: MHNowHomeInteractor? = nil
    
    // MARK: Manager
    let alertManager = AlertManager.shared
    
    func addActiveObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(selectMethod(_:)), name: .activeObserver, object: nil)
    }
    
    func removeActiveObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}

private extension MHNowHomePresenter {
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

protocol MHNowHomePresenterInput {
    func requestData()
    func viewWillAppear()
    func viewWillDissapear()
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
}

protocol MHNowHomePresenterOutput {
    func loadData(_ model: MHNowHomeViewModel)
}

extension MHNowHomePresenter: MHNowHomePresenterOutput {
    func loadData(_ model: MHNowHomeViewModel) {
        view?.loadData(model)
        view?.stopLoading()
    }
}
