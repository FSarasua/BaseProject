//
//  CustomTableViewDataSource.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 13/8/23.
//

import Foundation
import UIKit

public protocol FeedRenderable {
    var reuseIdentifier: String { get }
    var cellHeight: CGFloat { get }
}

extension BaseCellModel: FeedRenderable {
    public var reuseIdentifier: String {
        return cellType.cellID
    }
}

public final class CustomTableViewDataSource<Model>: NSObject, UITableViewDataSource, UITableViewDelegate where Model: FeedRenderable {
    public typealias CellConfigurator = (Model, UITableViewCell) -> Void
    public var headerTitles: [String?] = []
    public var models: [[Model]] = []
    
    public let cellConfigurator: CellConfigurator
    
    public init(_ cellConfigurator: @escaping CellConfigurator) {
        self.cellConfigurator = cellConfigurator
    }
    
    /* MARK: - UITableViewDataSource */
    public func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section >= headerTitles.count) || headerTitles.isEmpty {
            return nil
        }
        return headerTitles[section]
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath)
        cellConfigurator(model, cell)
        
        return cell
    }
    
    /* MARK: - UITableViewDelegate */
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return models[indexPath.section][indexPath.row].cellHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.section][indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath)
        var dict: Dictionary<String, Any> = Dictionary()
        dict.updateValue(MethodName.didSelectRowAt, forKey: KConstants.methodName)
        dict.updateValue(model, forKey: KConstants.param1)
        dict.updateValue(cell, forKey: KConstants.param2)
        NotificationCenter.default.post(name: .activeObserver, object: nil, userInfo: dict)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var dict: Dictionary<String, Any> = Dictionary()
        dict.updateValue(MethodName.didEndDisplaying, forKey: KConstants.methodName)
        dict.updateValue(cell, forKey: KConstants.param1)
        NotificationCenter.default.post(name: .activeObserver, object: nil, userInfo: dict)
    }
}

extension CustomTableViewDataSource where Model == BaseCellModel {
    public static func makeBase() -> CustomTableViewDataSource {
        return CustomTableViewDataSource() { model, cell in
            (cell as? MainTableViewCell)?.loadCellWith(model: model as! MainCellModel)
            (cell as? LabelTableViewCell)?.loadCellWith(model: model as! LabelCellModel)
            (cell as? ImageTableViewCell)?.loadCellWith(model: model as! ImageCellModel)
            (cell as? ImageLabelTableViewCell)?.loadCellWith(model: model as! ImageLabelCellModel)
        }
    }
}
