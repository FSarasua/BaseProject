//
//  LabelTableViewCell.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
    // MARK: Outlet
    @IBOutlet weak var lbTitle: UILabel!
    
    // MARK: Variable
    var model: LabelCellModel!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    // MARK: Public
    func loadCellWith(model: LabelCellModel) {
        self.model = model
        loadData()
        loadStyle()
    }
}

private extension LabelTableViewCell {
    func loadData() {
        lbTitle.text = model.label.title
    }
    
    func loadStyle() {
        if let titleTextAlignment = model.label.titleTextAlignment {
            lbTitle.textAlignment = titleTextAlignment
        }
    }
}
