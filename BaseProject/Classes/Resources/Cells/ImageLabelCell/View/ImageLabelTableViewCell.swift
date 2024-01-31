//
//  ImageLabelTableViewCell.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import UIKit

class ImageLabelTableViewCell: UITableViewCell {
    // MARK: Outlet
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    
    // MARK: Constraints
    var heightImgViewContraint: NSLayoutConstraint!
    var widthImgViewContraint: NSLayoutConstraint!
    
    // MARK: Variable
    var model: ImageLabelCellModel!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heightImgViewContraint.constant = 0.0
        widthImgViewContraint.constant = 0.0
        viewMain.removeAllConstraints()
        imgView.removeAllConstraints()
        lbTitle.removeAllConstraints()
    }
    
    // MARK: Public
    func loadCellWith(model: ImageLabelCellModel) {
        self.model = model
        loadData()
        loadStyle()
    }
}

private extension ImageLabelTableViewCell {
    func loadData() {
        imgView.image = UIImage.init(named: model.image.name)
        imgView.contentMode = model.image.contentMode
        setImageSize()
        setItemsPosition()
        
        if let label = model.label {
            lbTitle.text = label.title
        }
    }
    
    func setImageSize() {
        guard let height = model.image.height,
              let width = model.image.width else {
                  return
              }
        
        if heightImgViewContraint == nil, widthImgViewContraint == nil {
            heightImgViewContraint = imgView.heightAnchor.constraint(equalToConstant: height)
            widthImgViewContraint = imgView.widthAnchor.constraint(equalToConstant: width)
        } else {
            heightImgViewContraint.constant = height
            widthImgViewContraint.constant = width
        }
        heightImgViewContraint.isActive = true
        widthImgViewContraint.isActive = true
    }
    
    func setItemsPosition() {
        viewMain.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        
        /* VIEW MAIN */
        viewMain.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        viewMain.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        viewMain.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        viewMain.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        /* IMAGE VIEW */
        let greaterThanTopImgViewConstraint = imgView.topAnchor.constraint(greaterThanOrEqualTo: viewMain.topAnchor)
        let lessThanBottomImgViewConstraint = imgView.bottomAnchor.constraint(lessThanOrEqualTo: viewMain.bottomAnchor)
        let greaterThanLeadingImgViewConstraint = imgView.leadingAnchor.constraint(greaterThanOrEqualTo: viewMain.leadingAnchor)
        let lessThanTrailingImgViewConstraint = imgView.trailingAnchor.constraint(lessThanOrEqualTo: viewMain.trailingAnchor)
        
        let topImgViewConstraint = imgView.topAnchor.constraint(equalTo: viewMain.topAnchor)
        let bottomImgViewConstraint = imgView.bottomAnchor.constraint(equalTo: viewMain.bottomAnchor)
        let leadingImgViewConstraint = imgView.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor)
        let trailingImgViewConstraint = imgView.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor)
        
        let centerYImgViewConstraint = imgView.centerYAnchor.constraint(equalTo: viewMain.centerYAnchor)
        let centerXImgViewConstraint = imgView.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor)
        
        /* LABEL */
        let greaterThanTopLbTitleViewConstraint = lbTitle.topAnchor.constraint(greaterThanOrEqualTo: viewMain.topAnchor)
        let lessThanBottomLbTitleConstraint = lbTitle.bottomAnchor.constraint(lessThanOrEqualTo: viewMain.bottomAnchor)
        let greaterThanLeadingLbTitleConstraint = lbTitle.leadingAnchor.constraint(greaterThanOrEqualTo: viewMain.leadingAnchor)
        let lessThanTrailingLbTitleConstraint = lbTitle.trailingAnchor.constraint(lessThanOrEqualTo: viewMain.trailingAnchor)
        
        let topLbTitleConstraint = lbTitle.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 4)
        let bottomLbTitleConstraint = lbTitle.bottomAnchor.constraint(equalTo: viewMain.bottomAnchor)
        let leadingLbTitleContraint = lbTitle.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor)
        let trailingLbTitleConstraint = lbTitle.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor)
        
        let centerYLbTitleConstraint = lbTitle.centerYAnchor.constraint(equalTo: viewMain.centerYAnchor)
        let centerXLbTitleConstraint = lbTitle.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor)
        
        /* IMAGE VIEW -- LBTITLE */
        let trailingImgViewToLeadingLbTitle = imgView.trailingAnchor.constraint(equalTo: lbTitle.leadingAnchor, constant: -8)
        
        /* IMAGE VIEW || LBTITLE */
        let bottomImgViewToTopLbTitle = imgView.bottomAnchor.constraint(equalTo: lbTitle.topAnchor, constant: -8)

        greaterThanTopImgViewConstraint.isActive = false
        lessThanBottomImgViewConstraint.isActive = false
        greaterThanLeadingImgViewConstraint.isActive = false
        lessThanTrailingImgViewConstraint.isActive = false
        
        topImgViewConstraint.isActive = false
        bottomImgViewConstraint.isActive = false
        leadingImgViewConstraint.isActive = false
        trailingImgViewConstraint.isActive = false
        
        centerYImgViewConstraint.isActive = false
        centerXImgViewConstraint.isActive = false
        
        greaterThanTopLbTitleViewConstraint.isActive = false
        lessThanBottomLbTitleConstraint.isActive = false
        greaterThanLeadingLbTitleConstraint.isActive = false
        lessThanTrailingLbTitleConstraint.isActive = false
        
        topLbTitleConstraint.isActive = false
        bottomLbTitleConstraint.isActive = false
        leadingLbTitleContraint.isActive = false
        trailingLbTitleConstraint.isActive = false
        
        centerYLbTitleConstraint.isActive = false
        centerXLbTitleConstraint.isActive = false
        
        trailingImgViewToLeadingLbTitle.isActive = false
        bottomImgViewToTopLbTitle.isActive = false
        
        switch (model.image.position, model.label?.position) {
        case (.topLeft, .topRight):
            /* IMAGE VIEW */
            topImgViewConstraint.isActive = true
            lessThanBottomImgViewConstraint.isActive = true
            leadingImgViewConstraint.isActive = true
            /* LABEL */
            topLbTitleConstraint.isActive = true
            lessThanBottomLbTitleConstraint.isActive = true
            trailingLbTitleConstraint.isActive = true

            trailingImgViewToLeadingLbTitle.isActive = true
            break
        case (.centerLeft, .centerRight):
            /* IMAGE VIEW */
            greaterThanTopImgViewConstraint.isActive = true
            lessThanBottomImgViewConstraint.isActive = true
            leadingImgViewConstraint.isActive = true
            centerYImgViewConstraint.isActive = true
            /* LABEL */
            greaterThanTopLbTitleViewConstraint.isActive = true
            lessThanBottomLbTitleConstraint.isActive = true
            trailingLbTitleConstraint.isActive = true
            centerYLbTitleConstraint.isActive = true
            
            trailingImgViewToLeadingLbTitle.isActive = true
            break
        case (.bottomLeft, .bottomRight):
            /* IMAGE VIEW */
            greaterThanTopImgViewConstraint.isActive = true
            leadingImgViewConstraint.isActive = true
            bottomImgViewConstraint.isActive = true
            /* LABEL */
            greaterThanTopLbTitleViewConstraint.isActive = true
            bottomLbTitleConstraint.isActive = true
            trailingLbTitleConstraint.isActive = true
            
            trailingImgViewToLeadingLbTitle.isActive = true
            break
        case (.topLeft, .bottomLeft):
            /* IMAGE VIEW */
            topImgViewConstraint.isActive = true
            leadingImgViewConstraint.isActive = true
            lessThanTrailingImgViewConstraint.isActive = true
            /* LABEL */
            bottomLbTitleConstraint.isActive = true
            leadingLbTitleContraint.isActive = true
            lessThanTrailingLbTitleConstraint.isActive = true

            bottomImgViewToTopLbTitle.isActive = true
            break
        case (.topCenter, .bottomCenter):
            /* IMAGE VIEW */
            topImgViewConstraint.isActive = true
            greaterThanLeadingImgViewConstraint.isActive = true
            lessThanTrailingImgViewConstraint.isActive = true
            centerXImgViewConstraint.isActive = true
            /* LABEL */
            bottomLbTitleConstraint.isActive = true
            greaterThanLeadingLbTitleConstraint.isActive = true
            lessThanTrailingLbTitleConstraint.isActive = true
            centerXLbTitleConstraint.isActive = true

            bottomImgViewToTopLbTitle.isActive = true
            break
        case (.topRight, .bottomRight):
            /* IMAGE VIEW */
            topImgViewConstraint.isActive = true
            greaterThanLeadingImgViewConstraint.isActive = true
            trailingImgViewConstraint.isActive = true
            /* LABEL */
            bottomLbTitleConstraint.isActive = true
            greaterThanLeadingLbTitleConstraint.isActive = true
            trailingLbTitleConstraint.isActive = true

            bottomImgViewToTopLbTitle.isActive = true
            break
            
        default: /* Si hay otro valor, se pondrá por defecto a:
                  Image -> TOP LEFT
                  Label -> TOP RIGHT */
            /* IMAGE VIEW */
            topImgViewConstraint.isActive = true
            lessThanBottomImgViewConstraint.isActive = true
            leadingImgViewConstraint.isActive = true
            /* LABEL */
            topLbTitleConstraint.isActive = true
            lessThanBottomLbTitleConstraint.isActive = true
            trailingLbTitleConstraint.isActive = true

            trailingImgViewToLeadingLbTitle.isActive = true
            break
        }
    }
    
    func loadStyle() {
        if let titleTextAlignment = model.label?.titleTextAlignment {
            lbTitle.textAlignment = titleTextAlignment
        }
    }
}
