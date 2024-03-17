//
//  CustomImageView.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 15/8/23.
//

import Foundation
import UIKit

public class CustomImageView {
    var systemName: String
    var name: String
    var tintColor: UIColor
    var height: CGFloat?
    var width: CGFloat?
    var contentMode: UIView.ContentMode
    var position: ItemPosition
    
    public init(
        name: String = "",
        systemName: String = "",
        tintColor: UIColor = .label,
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        position: ItemPosition = .fill
    ) {
        self.systemName = systemName.isEmpty ? "" : systemName
        self.name = name.isEmpty && systemName.isEmpty ? "fdlogo" : name
        self.tintColor = tintColor
        self.height = height
        self.width = width
        self.position = position
        self.contentMode = contentMode
    }
    
    public init(
        topLeftWithName name: String,
        tintColor: UIColor = .label,
        height: CGFloat = 66.0,
        width: CGFloat = 66.0,
        contentMode: UIView.ContentMode = .scaleAspectFit
    ) {
        self.systemName = ""
        self.name = name
        self.tintColor = tintColor
        self.height = height
        self.width = width
        self.position = .topLeft
        self.contentMode = contentMode
    }
    
    public init(
        fillWithName name: String,
        tintColor: UIColor = .label,
        contentMode: UIView.ContentMode = .scaleAspectFit
    ) {
        self.systemName = ""
        self.name = name
        self.tintColor = tintColor
        self.position = .fill
        self.contentMode = contentMode
    }
}
