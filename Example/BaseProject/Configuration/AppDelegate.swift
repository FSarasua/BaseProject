//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import UIKit
import BaseProject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        
        let controller = Module.baseClassesTable.getViewController()
        let navigation = UINavigationController(rootViewController: controller)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigation.navigationBar.standardAppearance = appearance;
        navigation.navigationBar.scrollEdgeAppearance = navigation.navigationBar.standardAppearance
        
        window?.rootViewController = navigation
        
        return true
    }
}
