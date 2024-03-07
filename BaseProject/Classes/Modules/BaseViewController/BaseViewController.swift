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
    
    // MARK: Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    // MARK: Public
    public func performAsyncTask(methodName: String, task: @escaping () async throws -> Void) {
        let className = String(describing: type(of: self))
        Task {
            do {
                try await task()
            } catch {
                print("\(className) - \(methodName) - Error:", error.localizedDescription)
            }
        }
    }
    
    public func setNavigationBarHidden(_ value: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(value, animated: animated)
    }
    
    public func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc public func startLoadingBase() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            activityIndicator.startAnimating()
        }
    }
    
    @objc public func stopLoadingBase() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            activityIndicator.stopAnimating()
        }
    }
    
    @objc public func hideKeyboard() {
        view.endEditing(true)
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
}

public protocol Router {
    func push(_ controller: UIViewController)
    func present(_ controller: UIViewController)
    func popVC()
    func showAlert(_ alert: UIAlertController)
}

extension BaseViewController: Router {
    public func push(_ controller: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    public func present(_ controller: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            present(controller, animated: true, completion: nil)
        }
    }
    
    public func popVC() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController?.popViewController(animated: true)
        }
    }

    public func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            present(alert, animated: true, completion: nil)
        }
    }
}
