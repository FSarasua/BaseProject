//
//  Enums.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation
import UIKit

/* MARK: - Struct simulando un Enum. Struct like an Enum.
 Español: Struct preparado para funcionar como un Enum, pero con extensiones y así poder diversificar con nuevos casos a medida que se desarrolla en los subproyectos.
 English: Struct prepared to function as an Enum, but with extensions and thus be able to diversify with new cases as it is developed in the subprojects. */

public struct Module: RawRepresentable, Hashable {
    public typealias RawValue = String
    public let rawValue: RawValue
    public let className: String
    public let instance: UIViewController
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
        self.className = KClassName.baseStandard
        self.instance = BaseStandardAssembly.create()
    }
    
    public init(_ rawValue: String, className: String, instance: UIViewController) {
        self.rawValue = rawValue
        self.className = className
        self.instance = instance
    }
    
    /* MARK: - Casos del Enum. Enum cases. */
    public static let baseStandard = Module("baseStandard",
                                            className: KClassName.baseStandard,
                                            instance: BaseStandardAssembly.create())
    public static let baseStandardTable = Module("baseStandardTable",
                                            className: KClassName.baseStandardTable,
                                                 instance: BaseStandardTableAssembly.create())
}

/* MARK: - Cell Type */
public struct CellType: RawRepresentable, Hashable {
    public typealias RawValue = String
    public let rawValue: RawValue
    public let cellID: String
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
        self.cellID = KCellID.baseCell
    }
    
    public init(_ rawValue: RawValue, cellID: String) {
        self.rawValue = rawValue
        self.cellID = cellID
    }

    public var hashValue: Int {
        return rawValue.hashValue
    }
    
    /* MARK: - Casos del Enum. Enum cases. */
    public static let base = CellType("base", cellID: KCellID.baseCell)
    public static let main = CellType("main", cellID: KCellID.mainCell)
    public static let label = CellType("label", cellID: KCellID.labelCell)
    public static let image = CellType("image", cellID: KCellID.imageCell)
    public static let imageLabel = CellType("imageLabel", cellID: KCellID.imageLabelCell)
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
