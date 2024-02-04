//
//  ValidationManager.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation

public class ValidationManager {
    
    public static let shared = ValidationManager()
    
    public func validateURL(_ url: URL?,
                      onSuccess: @escaping (URL) -> Void,
                      onError: @escaping (CustomError) -> Void) {
        
        guard let url = url else {
            onError(CustomError(type: .notValidURL))
            return
        }
        onSuccess(url)
    }
    
    public func validateData(_ data: Data?,
                      onSuccess: @escaping (Data) -> Void,
                      onError: @escaping (CustomError) -> Void) {
        
        guard let data = data else {
            onError(CustomError(type: .dataError))
            return
        }
        
        let bytes = data.count
        
        if bytes > 0 {
            onSuccess(data)
        } else {
            onError(CustomError(type: .noDataContent))
        }
    }
    
    public func validateResponse(_ response: URLResponse?,
                          onSuccess: @escaping () -> Void,
                          onError: @escaping (CustomError) -> Void) {
        
        guard let response = response else {
            onError(CustomError(type: .responseError))
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            
            if httpResponse.statusCode != 200 {
                onError(CustomError(type: .statusCodeError))
            } else {
                onSuccess()
            }
        }
    }
    
    public func validateDataParsing<T : Decodable>(_ type: T.Type,
                                _ data: Data,
                                onSuccess: @escaping (T) -> Void,
                                onError: @escaping (CustomError) -> Void) {
        
        do {
            let serverModel = try JSONDecoder().decode(T.self, from: data)
            onSuccess(serverModel)
        } catch {
            onError(CustomError(type: .dataParsing))
        }
    }
}
