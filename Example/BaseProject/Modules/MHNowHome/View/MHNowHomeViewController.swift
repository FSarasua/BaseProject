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

// MARK: Private
private extension MHNowHomeViewController {
    func configView() {
        setNavigationTitle()
        loadImgView()
    }
    
    // MARK: View Model
    func setNavigationTitle() {
        title = presenter?.getNavigationTitle()
    }
    
    func loadImgView() { 
        guard let name = presenter?.getBackgroundImageName() else { return }
        imgBackground.image = UIImage(named: name)
    }
}

// MARK: Viper View Protocol
protocol MHNowHomeView {
    func startLoading()
    func stopLoading()
}

extension MHNowHomeViewController: MHNowHomeView {
    func startLoading() {
        startLoadingBase()
    }
    
    func stopLoading() {
        stopLoadingBase()
    }
}
