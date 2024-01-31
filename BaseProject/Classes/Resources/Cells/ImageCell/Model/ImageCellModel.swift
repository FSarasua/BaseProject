//
//  ImageCellModel.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import Foundation
import UIKit

public class ImageCellModel: BaseCellModel {
    var image: CustomImageView
    
    public override init() {
        self.image = CustomImageView()
        let cellHeight = image.height ?? UITableView.automaticDimension
        super.init(cellType: .image, cellHeight: cellHeight)
    }
    
    public init(image: CustomImageView, cellHeight: CGFloat = UITableView.automaticDimension) {
        self.image = image
        super.init(cellType: .image, cellHeight: cellHeight)
    }
}
