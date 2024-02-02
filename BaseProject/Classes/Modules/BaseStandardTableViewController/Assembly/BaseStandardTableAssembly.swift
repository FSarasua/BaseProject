//
//  BaseStandardTableAssembly.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

open class BaseStandardTableAssembly {
    
    public static func create() -> BaseStandardTableViewController {
        let vc = BaseStandardTableViewController.init(nibName: KClassName.baseStandardTable, bundle: KBundle.baseProject)
        let presenter = BaseStandardTablePresenter()
        let interactor = BaseStandardTableInteractor()
        let router = vc
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return vc
    }
}
