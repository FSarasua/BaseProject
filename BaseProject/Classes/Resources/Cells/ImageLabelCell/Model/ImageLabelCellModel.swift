//
//  ImageLabelCellModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import Foundation
import UIKit

public class ImageLabelCellModel: BaseCellModel {
    var image: CustomImageView
    var label: CustomLabel?
    
    public override init() {
        self.image = CustomImageView()
        self.label = CustomLabel()
        super.init(cellType: .imageLabel, cellHeight: UITableView.automaticDimension)
    }
    
    public init(image: CustomImageView,
         label: CustomLabel?,
         cellHeight: CGFloat = UITableView.automaticDimension) {
        self.image = image
        self.label = label
        super.init(cellType: .imageLabel, cellHeight: cellHeight)
    }
}
