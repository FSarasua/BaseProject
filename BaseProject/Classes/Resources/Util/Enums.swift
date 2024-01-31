//
//  Enums.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation
import UIKit

public enum BaseModule {
    case baseStandard
    case baseStandardTable
    case main
    
    init?(className: String) {
        switch className {
        case BaseKClassName.baseStandard: self = .baseStandard
        case BaseKClassName.baseStandardTable: self = .baseStandardTable
        default: return nil
        }
    }
    
    public func getViewController() -> UIViewController {
        switch self {
        case .baseStandard: return BaseStandardAssembly.create()
        case .baseStandardTable: return BaseStandardTableAssembly.create()
            default: return UIViewController()
        }
    }
}

public enum CellType {
    case base
    case main
    case label
    case image
    case imageLabel
    
    func getCellID() -> String {
        switch self {
        case .base: return KCellID.baseCell
        case .main: return KCellID.mainCell
        case .label: return KCellID.labelCell
        case .image: return KCellID.imageCell
        case .imageLabel: return KCellID.imageLabelCell
        }
    }
}

public enum CellActionName: String {
    case pushView
    case presentView
    case changeFontColor
    case changeFontSize
    case changeBackgroundColor
}

public enum ErrorType {
    case notValidURL
    case dataParsing
    
    case unknown
    
    /* URL Session */
    case dataError
    case noDataContent
    case responseError
    case statusCodeError
}

public enum AlertType {
    case error
}

public enum ItemPosition {
    case topLeft
    case topCenter
    case topRight
    case centerLeft
    case centerMiddle
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight
    case fill
}
