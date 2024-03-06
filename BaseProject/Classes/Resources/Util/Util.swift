//
//  Util.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 5/3/24.
//

import Foundation

struct Util {
    static func getLabelCellModel() -> LabelCellModel {
        LabelCellModel(label: CustomLabel(title: KCellID.labelCell, titleTextAlignment: .center))
    }
    
    static func getImageCellModel() -> ImageCellModel {
        let image = CustomImageView(name: "fdlogo",
                                    height: 100,
                                    width: 100,
                                    contentMode: .scaleAspectFit,
                                    position: .bottomRight)
        return ImageCellModel(image: image, cellHeight: 200)
    }
    
    // MARK: - Image Label Cell - Top to the side
    
    static func getImageLabelCellModelv1() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .topLeft)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .topRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    static func getImageLabelCellModelv2() -> ImageLabelCellModel {
        let image = CustomImageView(height: 50,
                                    width: 50,
                                    position: .topLeft)
        let label = CustomLabel(title: TestText.loremIpsum3,
                                titleTextAlignment: .center,
                                position: .topRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    // MARK: - Image Label Cell - Centered to the side
    
    static func getImageLabelCellModelv3() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .centerLeft)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .centerRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    static func getImageLabelCellModelv4() -> ImageLabelCellModel {
        let image = CustomImageView(height: 40,
                                    width: 40,
                                    position: .centerLeft)
        let label = CustomLabel(title: TestText.loremIpsum3,
                                titleTextAlignment: .center,
                                position: .centerRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    // MARK: - Image Label Cell - Bottom to the side
    
    static func getImageLabelCellModelv5() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .bottomLeft)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .bottomRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    static func getImageLabelCellModelv6() -> ImageLabelCellModel {
        let image = CustomImageView(height: 40,
                                    width: 40,
                                    position: .bottomLeft)
        let label = CustomLabel(title: TestText.loremIpsum3,
                                titleTextAlignment: .center,
                                position: .bottomRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    // MARK: - Image Label Cell - Left mounted
    
    static func getImageLabelCellModelv7() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .topLeft)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .bottomLeft)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    static func getImageLabelCellModelv8() -> ImageLabelCellModel {
        let image = CustomImageView(height: 40,
                                    width: 40,
                                    position: .topLeft)
        let label = CustomLabel(title: TestText.loremIpsum3,
                                titleTextAlignment: .center,
                                position: .bottomLeft)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    // MARK: - Image Label Cell - Centered mounted
    
    static func getImageLabelCellModelv9() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .topCenter)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .bottomCenter)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    static func getImageLabelCellModelv10() -> ImageLabelCellModel {
        let image = CustomImageView(height: 40,
                                    width: 40,
                                    position: .topCenter)
        let label = CustomLabel(title: TestText.loremIpsum3,
                                titleTextAlignment: .center,
                                position: .bottomCenter)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    // MARK: - Image Label Cell - Right mounted
    
    static func getImageLabelCellModelv11() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .topRight)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .bottomRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    static func getImageLabelCellModelv12() -> ImageLabelCellModel {
        let image = CustomImageView(height: 40,
                                    width: 40,
                                    position: .topRight)
        let label = CustomLabel(title: TestText.loremIpsum3,
                                titleTextAlignment: .center,
                                position: .bottomRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
}
