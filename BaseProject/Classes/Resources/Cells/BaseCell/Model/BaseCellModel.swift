//
//  BaseCellModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import Foundation
import UIKit

open class BaseCellModel {
    public let cellType: CellType
    public var cellHeight: CGFloat
    
    public init() {
        self.cellType = CellType.base
        self.cellHeight = UITableView.automaticDimension
    }
    
    public init(cellType: CellType, cellHeight: CGFloat) {
        self.cellType = cellType
        self.cellHeight = cellHeight
    }
}
