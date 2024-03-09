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

/* MARK: - Method Name */
public struct MethodName: RawRepresentable, Hashable {
    public typealias RawValue = String
    public let rawValue: RawValue
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(_ value: String) {
        self.rawValue = value
    }

    public var hashValue: Int {
        return rawValue.hashValue
    }
    
    /* MARK: - Casos del Enum. Enum cases. */
    public static let pushView = MethodName("pushView")
    public static let presentView = MethodName("presentView")
    public static let changeFontColor = MethodName("changeFontColor")
    public static let changeFontSize = MethodName("changeFontSize")
    public static let changeBackgroundColor = MethodName("changeBackgroundColor")
    public static let didSelectRowAt = MethodName("didSelectRowAt")
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
