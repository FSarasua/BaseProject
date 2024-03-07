//
//  MHNowHomeViewModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 23/9/23
//

import Foundation
import BaseProject

struct MHNowHomeViewModel {
    // MARK: Variables
    var navigationTitle: String
    var nameImgBackground: String
    
    // MARK: Builder
    init() {
        self.navigationTitle = "Monter Hunter Now"
        self.nameImgBackground = "mhnow_template"
    }
    
    init(navigationTitle: String, nameImgBackground: String) {
        self.navigationTitle = navigationTitle
        self.nameImgBackground = nameImgBackground
    }
}
