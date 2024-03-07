//
//  BaseStandardTableViewModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

struct BaseStandardTableViewModel {
    // MARK: Variables
    var navigationTitle: String
    var customDataSource: CustomTableViewDataSource<BaseCellModel>
    
    // MARK: Builder
    init() {
        self.navigationTitle = "Base Standard Table"
        self.customDataSource = .makeBase()
    }
    
    init(navigationTitle: String, customDataSource: CustomTableViewDataSource<BaseCellModel>) {
        self.navigationTitle = navigationTitle
        self.customDataSource = customDataSource
    }
}
