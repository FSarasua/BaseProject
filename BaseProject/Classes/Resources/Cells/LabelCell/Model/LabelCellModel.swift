//
//  LabelCellModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import Foundation
import UIKit

public class LabelCellModel: BaseCellModel {
    var label: CustomLabel
    
    public override init() {
        self.label = CustomLabel()
        super.init(cellType: CellType.label, cellHeight: 50.0)
    }
    
    public init(label: CustomLabel, cellHeight: CGFloat = 50.0) {
        self.label = label
        super.init(cellType: CellType.label, cellHeight: cellHeight)
    }
}
