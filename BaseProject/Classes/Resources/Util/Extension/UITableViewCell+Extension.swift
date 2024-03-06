//
//  UITableViewCell+Extension.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 5/3/24.
//

import Foundation

extension UITableViewCell {
    static public func getBaseLoadingCell() -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        var contentConfiguration = UIListContentConfiguration.cell()
        contentConfiguration.text = "Recuperando datos..."
        cell.contentConfiguration = contentConfiguration
        return cell
    }
}
