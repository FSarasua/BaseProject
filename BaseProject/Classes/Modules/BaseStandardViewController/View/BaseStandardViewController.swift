//
//  BaseStandardViewController.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import UIKit

public class BaseStandardViewController: UIViewController {

    // MARK: Viper
    var presenter: BaseStandardPresenterInput? = nil
    
    // MARK: Outlets
    
    // MARK: Data
    var viewModel = BaseStandardViewModel()
    
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
            navigationItem.title = viewModel.navigationTitle
        }
    }
}

// MARK: Viper View Protocol
protocol BaseStandardView {
    func loadData(_ data: BaseStandardViewModel)
    func stopLoading()
    func showAlert(_ alert: UIAlertController)
}

extension BaseStandardViewController: BaseStandardView {
    
    func loadData(_ data: BaseStandardViewModel) {
        self.viewModel = data
    }
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: Router
protocol BaseStandardRouter {
    
}

extension BaseStandardViewController: BaseStandardRouter {
    
}
