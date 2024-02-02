//
//  BaseStandardViewModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

class BaseStandardViewModel {
    var navigationTitle: String
    
    init() {
        self.navigationTitle = KClassName.baseStandard
    }
    
    init(navigationTitle: String) {
        self.navigationTitle = navigationTitle
    }
}
