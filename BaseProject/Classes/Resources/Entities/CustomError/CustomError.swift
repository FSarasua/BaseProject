//
//  CustomError.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation

public class CustomError: Error {
    var type: ErrorType
    var createdDate: Date
    var title: String?
    var message: String?
    
    public init(type: ErrorType, createdDate: Date = Date(), title: String, message: String) {
        self.type = type
        self.createdDate = createdDate
        self.title = title
        self.message = message
    }
    
    public init(type: ErrorType, createdDate: Date = Date()) {
        self.type = type
        self.createdDate = createdDate
        
        switch type {
        case .notValidURL:
            self.title = "title.error".localizeString()
            self.message = "message.notValidURL".localizeString()
            break
        case .dataParsing:
            self.title = "title.error".localizeString()
            self.message = "message.dataParsing".localizeString()
            break
        case .dataError:
            self.title = "title.serverError".localizeString()
            self.message = "message.dataError".localizeString()
            break
        case .noDataContent:
            self.title = "title.serverError".localizeString()
            self.message = "message.noDataContent".localizeString() 
            break
        case .responseError:
            self.title = "title.serverError".localizeString()
            self.message = "message.responseError".localizeString()
            break
        case .statusCodeError:
            self.title = "title.serverError".localizeString()
            self.message = "message.statusCodeError".localizeString()
            break
        case .unknown:
            self.title = "title.error".localizeString()
            self.message = "message.unknown".localizeString()
            break
        }
    }
}
