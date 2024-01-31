//
//  MHNowHomeAssembly.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 23/9/23
//

import Foundation

public class MHNowHomeAssembly {
    public static func create() -> MHNowHomeViewController {
        let vc = MHNowHomeViewController(nibName: String(describing: MHNowHomeViewController.self), bundle: nil)
        let presenter = MHNowHomePresenter()
        let interactor = MHNowHomeInteractor()
        let router = vc
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return vc
    }
}
