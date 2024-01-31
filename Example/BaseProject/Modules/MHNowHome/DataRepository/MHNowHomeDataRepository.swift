//
//  MHNowHomeDataRepository.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 23/9/23
//

import Foundation
import BaseProject

public class MHNowHomeDataRepository {
    
    public static let shared = MHNowHomeDataRepository()
    
    func getMHNowHomeViewModel() -> MHNowHomeViewModel {
        var model = MHNowHomeViewModel()
        
        model.navigationTitle = "Monter Hunter Now"
        model.nameImgBackground = "mhnow_template"
        
        return model
    }
}
