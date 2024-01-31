//
//  BaseStandardTableDataRepository.swift
//  Pods-BaseProject_Example
//
//  Created by Francisco Javier Sarasúa Galán on 4/9/23.
//

import Foundation

open class BaseStandardDataRepository {
    
    static let shared = BaseStandardDataRepository()
    
    func getBaseStandardViewModel() -> BaseStandardViewModel {
        let model = BaseStandardViewModel()
        
        return model 
    }
}
