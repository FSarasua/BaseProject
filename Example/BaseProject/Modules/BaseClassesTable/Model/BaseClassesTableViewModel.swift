//
//  BaseClassesTableViewModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 14/9/23
//

import Foundation
import BaseProject

struct BaseClassesTableViewModel {
    // MARK: Variables
    var navigationTitle: String
    var customDataSource: CustomTableViewDataSource<BaseCellModel>
    
    // MARK: Builder
    init() {
        self.navigationTitle = "baseclassestable.title".localizeString()
        self.customDataSource = .makeBase()
    }
    
    init(navigationTitle: String, customDataSource: CustomTableViewDataSource<BaseCellModel>) {
        self.navigationTitle = navigationTitle
        self.customDataSource = customDataSource
    }
}
