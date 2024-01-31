//
//  BaseStandardAssembly.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

public class BaseStandardAssembly {
    
    static func create() -> BaseStandardViewController {
        let vc = BaseStandardViewController.init(nibName: BaseKClassName.baseStandard, bundle: KBundle.baseProject)
        let presenter = BaseStandardPresenter()
        let interactor = BaseStandardInteractor()
        let router = vc
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return vc
    }
}
