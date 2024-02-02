//
//  BaseClassesTableAssembly.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 14/9/23
//

import Foundation
import BaseProject

public class BaseClassesTableAssembly {
    public static func create() -> BaseClassesTableViewController {
        let vc = BaseClassesTableViewController(nibName: KClassName.baseClassesTable, bundle: nil)
        let presenter = BaseClassesTablePresenter()
        let interactor = BaseClassesTableInteractor()
        let router = vc
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return vc
    }
}
