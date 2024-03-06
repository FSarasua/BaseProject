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
    
    // MARK: Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        super.performAsyncTask(methodName: #function) { [weak self] in
            self?.presenter?.requestData()
        }
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
        setNavigationTitle()
        configTableView()
    }
    
    func configTableView() {
        setTableViewDataSource()
        tableView.registerBaseCells()
    }
    
    func setTableViewDataSource() {
        tableView.delegate = presenter?.getDelegate()
        tableView.dataSource = presenter?.getDataSource()
    }
    
    func setNavigationTitle() {
        if let navigationController = navigationController, !navigationController.isNavigationBarHidden {
            title = presenter?.getNavigationTitle()
        }
    }
    
    func setNavigationBarHidden(_ value: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(value, animated: animated)
    }
}

// MARK: Viper View Protocol
protocol BaseClassesTableView {
    func reloadTableViewData()
    func startLoading()
    func stopLoading()
}

extension BaseClassesTableViewController: BaseClassesTableView {
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
}
