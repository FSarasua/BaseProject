//
//  Enums.swift
//  BaseProject_Example
//
//  Created by Francisco Javier Sarasúa Galán on 13/9/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import BaseProject

extension Module {
    static let baseClassesTable = Module("baseClassesTable", className: KClassName.baseClassesTable, instance: BaseClassesTableAssembly.create())
    static let exampleMHNow = Module("exampleMHNow", className: KClassName.exampleMHNow, instance: MHNowHomeAssembly.create())
}
