//
//  MainTableViewCell.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    // MARK: Outlet
    @IBOutlet weak var imgStar: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var btnRightArrow: UIButton!
    @IBOutlet weak var btnExample: UIButton!
    
    // MARK: Variable
    var model: MainCellModel!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    // MARK: Public
    func loadCellWith(model: MainCellModel) {
        self.model = model
        loadData()
        loadStyle()
    }
    
    @IBAction func touchUpInsideBtnRightArrow(_ sender: Any) {
        model.btnRightArrowFunction()
    }
    
    @IBAction func touchUpInsideBtnExample(_ sender: Any) {
        model.btnExampleFunction()
    }
}

private extension MainTableViewCell {
    func loadData() {
        imgStar.image = model.isReady ? UIImage.init(systemName: "star.fill") : UIImage.init(systemName: "star")
        lbTitle.text = model.title
        tvDescription.text = model.description
    }
    
    func loadStyle() {
        imgStar.tintColor = model.isReady ? UIColor.systemYellow : UIColor.darkGray
        btnRightArrow.isHidden = !model.isReady
    }
}
