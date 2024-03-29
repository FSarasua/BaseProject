//
//  BaseStandardTableViewController.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import UIKit

open class BaseStandardTableViewController: BaseViewController {
    
    // MARK: Viper
    var presenter: BaseStandardTablePresenterInput? = nil
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        super.performAsyncTask(methodName: #function) { [weak self] in
            guard let self = self else { return }
            presenter?.requestData()
        }
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
        tableView.delegate = presenter?.getDelegate()
        tableView.dataSource = presenter?.getDataSource()
        tableView.registerBaseCells()
    }
    
    // MARK: - View Model
    func setNavigationTitle() {
        if let navigationController = navigationController,
            !navigationController.isNavigationBarHidden {
            title = presenter?.getNavigationTitle()
        }
    }
}

// MARK: Viper View Protocol
protocol BaseStandardTableView {
    func reloadTableViewData()
    func startLoading()
    func stopLoading()
}

extension BaseStandardTableViewController: BaseStandardTableView {
    func reloadTableViewData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            tableView.reloadData()
        }
    }
    
    func startLoading() {
        startLoadingBase()
    }
    
    func stopLoading() {
        stopLoadingBase()
    }
}
