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
        addGesture()
    }
    
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
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
    
    @objc func hideKeyboard() {
        view.endEditing(true)
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
        navigationController?.pushViewController(controller, animated: true)
    }
    
    public func present(_ controller: UIViewController) {
        present(controller, animated: true, completion: nil)
    }
    
    public func popVC() {
        navigationController?.popViewController(animated: true)
    }

    public func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
