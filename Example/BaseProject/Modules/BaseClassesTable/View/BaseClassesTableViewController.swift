//
//  BaseClassesTableViewController.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 14/9/23
//

import UIKit
import BaseProject

public class BaseClassesTableViewController: BaseViewController {

    // MARK: Viper
    var presenter: BaseClassesTablePresenterInput? = nil
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Data
    var viewModel = BaseClassesTableViewModel()
    var customDataSource = CustomTableViewDataSource.make()
    
    // MARK: Life Cycle
    public override func viewDidLoad() {
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

// MARK: Private
private extension BaseClassesTableViewController {
    func configView() {
        configNavigationBar()
        configTableView()
    }
    
    func configNavigationBar() {
        /* BaseProject: Esta línea está comentada para poder volver al listado. Descomentar para visualizar sin barra de navegación.*/
        //        navigationController?.setNavigationBarHidden(true, animated: false)
        if !(navigationController?.isNavigationBarHidden ?? false) {
            navigationItem.title = self.viewModel.navigationTitle
        }
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = customDataSource
        tableView.registerCells()
    }
    
    func setNavigationBarHidden(_ value: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(value, animated: animated)
    }
}

// MARK: Viper View Protocol
protocol BaseClassesTableView {
    func loadData(_ data: BaseClassesTableViewModel)
    func reloadTableViewData()
    func startLoading()
    func stopLoading()
    func showAlert(_ alert: UIAlertController)
}

extension BaseClassesTableViewController: BaseClassesTableView {
    
    func loadData(_ data: BaseClassesTableViewModel) {
        viewModel = data
        customDataSource.models = viewModel.tableViewData
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func startLoading() {
        startLoadingBase()
    }
    
    @objc func stopLoading() {
        stopLoadingBase()
    }
    
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: Delegate Table View
extension BaseClassesTableViewController: UITableViewDelegate  {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellModel = viewModel.tableViewData[indexPath.row]
        return cellModel.cellHeight
    }
}

// MARK: Router
protocol BaseClassesTableRouter {
    func open(_ controller: UIViewController)
    func present(_ controller: UIViewController)
}

extension BaseClassesTableViewController: BaseClassesTableRouter {
    func open(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func present(_ controller: UIViewController) {
        present(controller, animated: true, completion: nil)
    }
}
