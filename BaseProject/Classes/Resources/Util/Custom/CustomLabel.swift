//
//  CustomLabel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 15/8/23.
//

import Foundation
import UIKit

public class CustomLabel {
    var title: String
    var titleTextAlignment: NSTextAlignment?
    var position: ItemPosition
    
    public init(title: String = "",
         titleTextAlignment: NSTextAlignment = .left,
         position: ItemPosition = .centerMiddle) {
        self.title = title
        self.titleTextAlignment = titleTextAlignment
        self.position = position
    }
}
