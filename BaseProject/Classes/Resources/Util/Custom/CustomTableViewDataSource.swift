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
}

extension BaseCellModel: FeedRenderable {
    public var reuseIdentifier: String {
        return cellType.cellID
    }
}

public final class CustomTableViewDataSource<Model>: NSObject, UITableViewDataSource where Model: FeedRenderable {
    typealias CellConfigurator = (Model, UITableViewCell) -> Void
    public var models: [Model] = []
    
    private let cellConfigurator: CellConfigurator
    
    init(_ cellConfigurator: @escaping CellConfigurator) {
        self.cellConfigurator = cellConfigurator
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath)
        cellConfigurator(model, cell)
        
        return cell
    }
}

extension CustomTableViewDataSource where Model == BaseCellModel {
    public static func make() -> CustomTableViewDataSource {
        return CustomTableViewDataSource() { model, cell in
            (cell as? MainTableViewCell)?.loadCellWith(model: model as! MainCellModel)
            (cell as? LabelTableViewCell)?.loadCellWith(model: model as! LabelCellModel)
            (cell as? ImageTableViewCell)?.loadCellWith(model: model as! ImageCellModel)
            (cell as? ImageLabelTableViewCell)?.loadCellWith(model: model as! ImageLabelCellModel)
        }
    }
}
