//
//  BaseCellModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import Foundation
import UIKit

public class BaseCellModel {
    public let cellType: CellType
    public var cellHeight: CGFloat
    
    init() {
        self.cellType = .base
        self.cellHeight = UITableView.automaticDimension
    }
    
    init(cellType: CellType, cellHeight: CGFloat) {
        self.cellType = cellType
        self.cellHeight = cellHeight
    }
}
