//
//  BaseTableViewCell.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {
    // MARK: Outlet
    @IBOutlet private weak var lbTitleBaseCell: UILabel!
    
    // MARK: Variable
    private var model: BaseCellModel!
    
    // MARK: Life Cycle
    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    // MARK: Public
    public func loadCellWith(model: BaseCellModel) {
        self.model = model
        loadData()
        loadStyle()
    }
}

private extension BaseTableViewCell {
    func loadData() {
    }
    
    func loadStyle() {
    }
}
