//
//  MainCellModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import Foundation
import UIKit

public class MainCellModel: BaseCellModel {
    var isReady: Bool
    var title: String
    var description: String
    var btnRightArrowFunction: () -> Void
    var btnExampleFunction: () -> Void
    
    public override init() {
        self.isReady = false
        self.title = ""
        self.description = ""
        self.btnRightArrowFunction = { print("btnRightArrowFunction TAPPED") }
        self.btnExampleFunction = { print("btnExampleFunction TAPPED") }
        super.init(cellType: .main, cellHeight: UITableView.automaticDimension)
    }
    
    public init(isReady: Bool, title: String, description: String, btnRightArrowFunction: @escaping () -> Void, btnExampleFunction: @escaping () -> Void, cellHeight: CGFloat = UITableView.automaticDimension) {
        self.isReady = isReady
        self.title = title
        self.description = description
        self.btnRightArrowFunction = btnRightArrowFunction
        self.btnExampleFunction = btnExampleFunction
        super.init(cellType: .main, cellHeight: cellHeight)
    }
}
