//
//  BaseStandardViewController.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import UIKit

public class BaseStandardViewController: BaseViewController {
    // MARK: Viper
    var presenter: BaseStandardPresenterInput? = nil
    
    // MARK: Outlets
    
    // MARK: Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.requestData()
    }
}

private extension BaseStandardViewController {
    func setNavigationTitle() {
        /* BaseProject: Esta línea está comentada para poder volver al listado. Descomentar para visualizar sin barra de navegación.*/
        //        navigationController?.setNavigationBarHidden(true, animated: false)
        if let navigationController = navigationController, !navigationController.isNavigationBarHidden {
            title = presenter?.getNavigationTitle()
        }
    }
}

// MARK: Viper View Protocol
protocol BaseStandardView {
    func loadData()
    func startLoading()
    func stopLoading()
}

extension BaseStandardViewController: BaseStandardView {
    func loadData() {
        setNavigationTitle()
    }
    
    func startLoading() {
        startLoadingBase()
    }
    
    func stopLoading() {
        stopLoadingBase()
    }
}
