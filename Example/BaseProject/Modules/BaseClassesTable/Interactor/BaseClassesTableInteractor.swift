//
//  BaseClassesTableInteractor.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 14/9/23
//

import Foundation
import BaseProject

class BaseClassesTableInteractor {
    // MARK: Viper
    var presenter: BaseClassesTablePresenterOutput? = nil
    
    // MARK: Manager
    let urlSessionManager = URLSessionManager.shared
    let validationManager = ValidationManager.shared
}

private extension BaseClassesTableInteractor {
    func getModelExamples() -> [BaseCellModel] {
        let baseStandardVCCell = MainCellModel(
            isReady: true,
            title: KClassName.baseStandard,
            description: TextDescription.baseStandard,
            btnRightArrowFunction: {
                var dict: Dictionary<String, Any> = Dictionary()
                dict.updateValue(MethodName.pushView, forKey: KConstants.methodName)
                dict.updateValue(BaseStandardAssembly.create(), forKey: KConstants.param1)
                NotificationCenter.default.post(name: .activeObserver, object: nil, userInfo: dict)
            },
            btnExampleFunction: {
                var dict: Dictionary<String, Any> = Dictionary()
                dict.updateValue(MethodName.pushView, forKey: KConstants.methodName)
                dict.updateValue(MHNowHomeAssembly.create(), forKey: KConstants.param1)
                NotificationCenter.default.post(name: .activeObserver, object: nil, userInfo: dict)
            },
            cellHeight: 200.0)
        let baseStandardTableVCCell = MainCellModel(
            isReady: true,
            title: KClassName.baseStandardTable,
            description: TextDescription.baseStandardTable,
            btnRightArrowFunction: {
                var dict: Dictionary<String, Any> = Dictionary()
                dict.updateValue(MethodName.pushView, forKey: KConstants.methodName)
                dict.updateValue(BaseStandardTableAssembly.create(), forKey: KConstants.param1)
                NotificationCenter.default.post(name: .activeObserver, object: nil, userInfo: dict)
            },
            btnExampleFunction: { },
            cellHeight: 200.0)
        return [baseStandardVCCell, baseStandardTableVCCell]
    }
}

protocol BaseClassesTableInteractorInput {
    func requestData()
}

extension BaseClassesTableInteractor: BaseClassesTableInteractorInput {
    func requestData() {
        let models = getModelExamples()
        presenter?.loadData(models: models)
    }
}
