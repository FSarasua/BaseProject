//
//  BaseStandardTableViewController.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import UIKit

open class BaseStandardTableViewController: UIViewController {
    
    // MARK: Viper
    var presenter: BaseStandardTablePresenterInput? = nil
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Data
    var viewModel = BaseStandardTableViewModel()
    var customDataSource = CustomTableViewDataSource.make()
    
    // MARK: Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        presenter?.requestData()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        presenter?.viewWillDissapear()
    }
}

private extension BaseStandardTableViewController {
    func configView() {
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = customDataSource
        tableView.registerCells()
    }
    
    func setNavigationTitle() {
        /* BaseProject: Esta línea está comentada para poder volver al listado. Descomentar para visualizar sin barra de navegación.*/
        //        navigationController?.setNavigationBarHidden(true, animated: false)
        if let navigationController = navigationController, !navigationController.isNavigationBarHidden {
            title = viewModel.navigationTitle
        }
    }
    
    func setNavigationBarHidden(_ value: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(value, animated: animated)
    }
}

// MARK: Viper View Protocol
protocol BaseStandardTableView {
    func loadData(_ data: BaseStandardTableViewModel)
    func reloadTableViewData()
    func stopLoading()
    func showAlert(_ alert: UIAlertController)
}

extension BaseStandardTableViewController: BaseStandardTableView {
    
    func loadData(_ data: BaseStandardTableViewModel) {
        viewModel = data
        setNavigationTitle()
        customDataSource.models = viewModel.tableViewData
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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

// MARK: Delegate Table View
extension BaseStandardTableViewController: UITableViewDelegate  {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellModel = viewModel.tableViewData[indexPath.row]
        return cellModel.cellHeight
    }
}

// MARK: Router
protocol BaseStandardTableRouter {
    func open(_ controller: UIViewController)
    func present(_ controller: UIViewController)
}

extension BaseStandardTableViewController: BaseStandardTableRouter {
    func open(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func present(_ controller: UIViewController) {
        present(controller, animated: true, completion: nil)
    }
}
