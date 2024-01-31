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
    var tableViewData: [BaseCellModel]
    
    // MARK: Builder
    init() {
        self.navigationTitle = ""
        self.tableViewData = [BaseCellModel]()
    }
    
    init(navigationTitle: String, tableViewData: [BaseCellModel]) {
        self.navigationTitle = navigationTitle
        self.tableViewData = tableViewData
    }
}
