//
//  BaseStandardTableViewModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

struct BaseStandardTableViewModel {
    var navigationTitle: String
    var customDataSource: CustomTableViewDataSource<BaseCellModel>
    
    init() {
        self.navigationTitle = "Base Standard Table"
        self.customDataSource = .makeBase()
    }
    
    init(navigationTitle: String, customDataSource: CustomTableViewDataSource<BaseCellModel>, models: [BaseCellModel]) {
        self.navigationTitle = navigationTitle
        self.customDataSource = customDataSource
    }
}
