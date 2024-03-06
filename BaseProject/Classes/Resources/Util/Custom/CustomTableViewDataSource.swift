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
    public var models: [Model] = []
    
    public let cellConfigurator: CellConfigurator
    
    public init(_ cellConfigurator: @escaping CellConfigurator) {
        self.cellConfigurator = cellConfigurator
    }
    
    /* MARK: - UITableViewDataSource */
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath)
        cellConfigurator(model, cell)
        
        return cell
    }
    
    /* MARK: - UITableViewDelegate */
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return models[indexPath.row].cellHeight
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
