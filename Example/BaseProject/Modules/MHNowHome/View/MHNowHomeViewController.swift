//
//  MHNowHomeViewController.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 23/9/23
//

import UIKit
import BaseProject

public class MHNowHomeViewController: BaseViewController {

    // MARK: Viper
    var presenter: MHNowHomePresenterInput? = nil
    
    // MARK: Outlets
    @IBOutlet weak var imgBackground: UIImageView!
    
    // MARK: Data
    var viewModel = MHNowHomeViewModel()
    
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
private extension MHNowHomeViewController {
    func configView() {
        
    }
    
    func loadNavigationBarTitle() {
        navigationItem.title = viewModel.navigationTitle
    }
    
    func loadImgView() {
        imgBackground.image = UIImage(named: viewModel.nameImgBackground)
    }
    
    func setNavigationBarHidden(_ value: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(value, animated: animated)
    }
}

// MARK: Viper View Protocol
protocol MHNowHomeView {
    func loadData(_ data: MHNowHomeViewModel)
    func startLoading()
    func stopLoading()
    func showAlert(_ alert: UIAlertController)
}

extension MHNowHomeViewController: MHNowHomeView {
    
    func loadData(_ data: MHNowHomeViewModel) {
        viewModel = data
        loadNavigationBarTitle()
        loadImgView()
    }
    
    func startLoading() {
        startLoadingBase()
    }
    
    func stopLoading() {
        stopLoadingBase()
    }
    
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: Router
protocol MHNowHomeRouter {
    func open(_ controller: UIViewController)
    func present(_ controller: UIViewController)
}

extension MHNowHomeViewController: MHNowHomeRouter {
    func open(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func present(_ controller: UIViewController) {
        present(controller, animated: true, completion: nil)
    }
}
