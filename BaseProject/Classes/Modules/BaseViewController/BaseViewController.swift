//
//  BaseViewController.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 13/9/23.
//

import Foundation

open class BaseViewController: UIViewController {
    
    // MARK: Variables
    private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Constants
    
    // MARK: Constants (Testing)
    
    
    // MARK: Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    // MARK: Public
    @objc public func startLoadingBase() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    @objc public func stopLoadingBase() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
}

// MARK: Private
private extension BaseViewController {
    func configView() {
        configActivityIndicator()
    }
    
    func configActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}