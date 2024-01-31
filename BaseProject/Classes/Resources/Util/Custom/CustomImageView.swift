//
//  CustomImageView.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 15/8/23.
//

import Foundation
import UIKit

public class CustomImageView {
    var name: String
    var height: CGFloat?
    var width: CGFloat?
    var contentMode: UIView.ContentMode
    var position: ItemPosition
    
    public init(name: String = "fdlogo",
         height: CGFloat? = nil,
         width: CGFloat? = nil,
         contentMode: UIView.ContentMode = .scaleAspectFit,
         position: ItemPosition = .fill) {
        self.name = name
        self.height = height
        self.width = width
        self.position = position
        self.contentMode = contentMode
    }
    
    public init(topLeftWithName name: String,
         height: CGFloat = 66.0,
         width: CGFloat = 66.0,
         contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.name = name
        self.height = height
        self.width = width
        self.position = .topLeft
        self.contentMode = contentMode
    }
    
    public init(fillWithName name: String,
         contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.name = name
        self.position = .fill
        self.contentMode = contentMode
    }
}
