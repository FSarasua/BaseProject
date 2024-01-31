//
//  Enums.swift
//  BaseProject_Example
//
//  Created by Francisco Javier Sarasúa Galán on 13/9/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import BaseProject

enum Module {
    case baseClassesTable
    case exampleMHNow
    
    init?(className: String) {
        switch className {
        case KClassName.baseClassesTable: self = .baseClassesTable
        case KClassName.exampleMHNow: self = .exampleMHNow
        default: return nil
        }
    }
    
    public func getViewController() -> UIViewController {
        switch self {
        case .baseClassesTable: return BaseClassesTableAssembly.create()
        case .exampleMHNow: return MHNowHomeAssembly.create()
        }
    }
}
