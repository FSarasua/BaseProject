//
//  BaseClassesTableDataRepository.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import Foundation
import BaseProject

public class BaseClassesTableDataRepository {
    
    public static let shared = BaseClassesTableDataRepository()
    
    func getBaseClassesTableViewModel() -> BaseClassesTableViewModel {
        var model = BaseClassesTableViewModel()
        
        model.navigationTitle = "".localizeString()
        
        let baseStandardVCCell = MainCellModel(isReady: true,
                                               title: BaseKClassName.baseStandard,
                                               description: TextDescription.baseStandard,
                                               btnRightArrowFunction: {
            var dict: Dictionary<String, Any> = Dictionary()
            dict.updateValue(CellActionName.pushView, forKey: "NAME")
            dict.updateValue(BaseModule.baseStandard, forKey: "PARAM1")
            NotificationCenter.default.post(name: .activeObserver, object: nil, userInfo: dict)
        },
                                                btnExampleFunction: {
            var dict: Dictionary<String, Any> = Dictionary()
            dict.updateValue(CellActionName.pushView, forKey: "NAME")
            dict.updateValue(Module.exampleMHNow, forKey: "PARAM1")
            NotificationCenter.default.post(name: .activeObserver, object: nil, userInfo: dict)
        }, cellHeight: 200.0)
        let baseStandardTableVCCell = MainCellModel(isReady: true,
                                                    title: BaseKClassName.baseStandardTable,
                                                    description: TextDescription.baseStandardTable,
                                                    btnRightArrowFunction: {
            var dict: Dictionary<String, Any> = Dictionary()
            dict.updateValue(CellActionName.pushView, forKey: "NAME")
            dict.updateValue(BaseModule.baseStandardTable, forKey: "PARAM1")
            NotificationCenter.default.post(name: .activeObserver, object: nil, userInfo: dict)
        },
                                                    btnExampleFunction: {
            
        }, cellHeight: 200.0)
        
        model.tableViewData.append(contentsOf: [baseStandardVCCell, baseStandardTableVCCell])
        
        return model
    }
    
    func getExamplesCell() -> [BaseCellModel] {
        let labelCellModel = getLabelCellModel()
        let imageCellModel = getImageCellModel()
        let imageLabelCellModelv1 = getImageLabelCellModelv1()
        let imageLabelCellModelv2 = getImageLabelCellModelv2()
        let imageLabelCellModelv3 = getImageLabelCellModelv3()
        let imageLabelCellModelv4 = getImageLabelCellModelv4()
        let imageLabelCellModelv5 = getImageLabelCellModelv5()
        let imageLabelCellModelv6 = getImageLabelCellModelv6()
        let imageLabelCellModelv7 = getImageLabelCellModelv7()
        let imageLabelCellModelv8 = getImageLabelCellModelv8()
        let imageLabelCellModelv9 = getImageLabelCellModelv9()
        let imageLabelCellModelv10 = getImageLabelCellModelv10()
        let imageLabelCellModelv11 = getImageLabelCellModelv11()
        let imageLabelCellModelv12 = getImageLabelCellModelv12()
        
        return [labelCellModel,
                imageCellModel,
                imageLabelCellModelv1,
                imageLabelCellModelv2,
                imageLabelCellModelv3,
                imageLabelCellModelv4,
                imageLabelCellModelv5,
                imageLabelCellModelv6,
                imageLabelCellModelv7,
                imageLabelCellModelv8,
                imageLabelCellModelv9,
                imageLabelCellModelv10,
                imageLabelCellModelv11,
                imageLabelCellModelv12
        ]
    }
    
    func getLabelCellModel() -> LabelCellModel {
        LabelCellModel(label: CustomLabel(title: KCellID.labelCell, titleTextAlignment: .center))
    }
    
    func getImageCellModel() -> ImageCellModel {
        let image = CustomImageView(name: "fdlogo",
                                    height: 100,
                                    width: 100,
                                    contentMode: .scaleAspectFit,
                                    position: .bottomRight)
        return ImageCellModel(image: image, cellHeight: 200)
    }
    
    // MARK: - Image Label Cell - Top to the side
    
    func getImageLabelCellModelv1() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .topLeft)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .topRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    func getImageLabelCellModelv2() -> ImageLabelCellModel {
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
    
    func getImageLabelCellModelv3() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .centerLeft)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .centerRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    func getImageLabelCellModelv4() -> ImageLabelCellModel {
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
    
    func getImageLabelCellModelv5() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .bottomLeft)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .bottomRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    func getImageLabelCellModelv6() -> ImageLabelCellModel {
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
    
    func getImageLabelCellModelv7() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .topLeft)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .bottomLeft)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    func getImageLabelCellModelv8() -> ImageLabelCellModel {
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
    
    func getImageLabelCellModelv9() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .topCenter)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .bottomCenter)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    func getImageLabelCellModelv10() -> ImageLabelCellModel {
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
    
    func getImageLabelCellModelv11() -> ImageLabelCellModel {
        let image = CustomImageView(height: 100,
                                    width: 100,
                                    position: .topRight)
        let label = CustomLabel(title: KCellID.imageLabelCell,
                                titleTextAlignment: .center,
                                position: .bottomRight)
        return ImageLabelCellModel(image: image,
                            label: label)
    }
    
    func getImageLabelCellModelv12() -> ImageLabelCellModel {
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
