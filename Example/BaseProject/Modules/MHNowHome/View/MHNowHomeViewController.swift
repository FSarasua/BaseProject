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
    
    // MARK: Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
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
    func setNavigationBarHidden(_ value: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(value, animated: animated)
    }
    
    // MARK: View Model
    func setNavigationTitle() {
        title = presenter?.getNavigationTitle()
    }
    
    func loadImgView() {
        
    }
}

// MARK: Viper View Protocol
protocol MHNowHomeView {
    func loadData()
    func startLoading()
    func stopLoading()
}

extension MHNowHomeViewController: MHNowHomeView {
    func loadData() { 
        setNavigationTitle()
        loadImgView()
    }
    
    func startLoading() {
        startLoadingBase()
    }
    
    func stopLoading() {
        stopLoadingBase()
    }
}
