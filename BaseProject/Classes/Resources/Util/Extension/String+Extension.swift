//
//  String+Extension.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 6/4/22.
//

import Foundation

public extension String {
    func localizeString() -> String {
        let path = Bundle.main.path(forResource: Locale.current.languageCode, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
