//
//  BaseStandardTableViewModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

struct BaseStandardTableViewModel {
    var navigationTitle: String
    var tableViewData: [BaseCellModel]
    
    init() {
        self.navigationTitle = ""
        self.tableViewData = [BaseCellModel]()
    }
    
    init(navigationTitle: String, tableViewData: [BaseCellModel]) {
        self.navigationTitle = navigationTitle
        self.tableViewData = tableViewData
    }
}
