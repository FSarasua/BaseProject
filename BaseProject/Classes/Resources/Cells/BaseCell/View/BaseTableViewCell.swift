//
//  BaseTableViewCell.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    // MARK: Outlet
    @IBOutlet weak var lbTitle: UILabel!
    
    // MARK: Variable
    var data: BaseCellModel!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    // MARK: Public
    func loadCellWith(data: BaseCellModel) {
        self.data = data
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
