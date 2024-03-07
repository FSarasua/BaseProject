//
//  BaseStandardTableInteractor.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasua Galan on 11/8/23.
//

import Foundation

class BaseStandardTableInteractor {
    // MARK: Viper
    var presenter: BaseStandardTablePresenterOutput? = nil
    
    // MARK: Manager
    let urlSessionManager = URLSessionManager.shared
}

private extension BaseStandardTableInteractor {
    func getModelExamples() -> [BaseCellModel] {
        let labelCellModel = Util.getLabelCellModel()
        let imageCellModel = Util.getImageCellModel()
        let imageLabelCellModelv1 = Util.getImageLabelCellModelv1()
        let imageLabelCellModelv2 = Util.getImageLabelCellModelv2()
        let imageLabelCellModelv3 = Util.getImageLabelCellModelv3()
        let imageLabelCellModelv4 = Util.getImageLabelCellModelv4()
        let imageLabelCellModelv5 = Util.getImageLabelCellModelv5()
        let imageLabelCellModelv6 = Util.getImageLabelCellModelv6()
        let imageLabelCellModelv7 = Util.getImageLabelCellModelv7()
        let imageLabelCellModelv8 = Util.getImageLabelCellModelv8()
        let imageLabelCellModelv9 = Util.getImageLabelCellModelv9()
        let imageLabelCellModelv10 = Util.getImageLabelCellModelv10()
        let imageLabelCellModelv11 = Util.getImageLabelCellModelv11()
        let imageLabelCellModelv12 = Util.getImageLabelCellModelv12()
        
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
                imageLabelCellModelv12]
    }
}

protocol BaseStandardTableInteractorInput {
    func requestData()
}

extension BaseStandardTableInteractor: BaseStandardTableInteractorInput {
    func requestData() {
        let models = getModelExamples()
        presenter?.loadData(models: models)
    }
}
