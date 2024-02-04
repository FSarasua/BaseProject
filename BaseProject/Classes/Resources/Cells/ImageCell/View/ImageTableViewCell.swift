//
//  ImageTableViewCell.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 11/8/23.
//

import UIKit

public class ImageTableViewCell: UITableViewCell {
    // MARK: Outlet
    @IBOutlet private weak var imgView: UIImageView!
    
    // MARK: Constraints
    private var heightConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?
    
    // MARK: Variable
    private var model: ImageCellModel!
    
    // MARK: Life Cycle
    public override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    // MARK: Public
    func loadCellWith(model: ImageCellModel) {
        self.model = model
        loadData()
        loadStyle()
    }
}

private extension ImageTableViewCell {
    func loadData() {
        imgView.image = UIImage.init(named: model.image.name)
        imgView.contentMode = model.image.contentMode
        setImageSize()
        setItemPosition()
    }
    
    func setImageSize() {
        if heightConstraint == nil, widthConstraint == nil {
            let height = model.image.height ?? 0.0
            let width = model.image.width ?? 0.0
            
            heightConstraint = imgView.heightAnchor.constraint(equalToConstant: height)
            heightConstraint?.priority = .required
            widthConstraint = imgView.widthAnchor.constraint(equalToConstant: width)
            widthConstraint?.priority = .required
        }
    }
    
    func setItemPosition() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        let greaterThanTopConstraint = imgView.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor)
        let lessThanBottomConstraint = imgView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        let greaterThanLeadingConstraint = imgView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor)
        let lessThanTrailingConstraint = imgView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor)
        
        let topConstraint = imgView.topAnchor.constraint(equalTo: self.topAnchor)
        let bottomConstraint = imgView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let trailingConstraint = imgView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let leadingConstraint = imgView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        
        let centerXConstraint = imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerYConstraint = imgView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        greaterThanTopConstraint.isActive = false
        lessThanBottomConstraint.isActive = false
        greaterThanLeadingConstraint.isActive = false
        lessThanTrailingConstraint.isActive = false
        
        topConstraint.isActive = false
        bottomConstraint.isActive = false
        trailingConstraint.isActive = false
        leadingConstraint.isActive = false
        
        centerXConstraint.isActive = false
        centerYConstraint.isActive = false
        
        heightConstraint?.isActive = true
        widthConstraint?.isActive = true
        
        switch model.image.position {
        case .topLeft:
            topConstraint.isActive = true
            lessThanBottomConstraint.isActive = true
            leadingConstraint.isActive = true
            lessThanTrailingConstraint.isActive = true
            break
        case .topCenter:
            topConstraint.isActive = true
            lessThanBottomConstraint.isActive = true
            greaterThanLeadingConstraint.isActive = true
            lessThanTrailingConstraint.isActive = true
            
            centerXConstraint.isActive = true
            break
        case .topRight:
            topConstraint.isActive = true
            lessThanBottomConstraint.isActive = true
            greaterThanLeadingConstraint.isActive = true
            trailingConstraint.isActive = true
            break
        case .centerLeft:
            greaterThanTopConstraint.isActive = true
            lessThanBottomConstraint.isActive = true
            leadingConstraint.isActive = true
            lessThanTrailingConstraint.isActive = true
            
            centerYConstraint.isActive = true
            break
        case .centerMiddle:
            greaterThanTopConstraint.isActive = true
            lessThanBottomConstraint.isActive = true
            greaterThanLeadingConstraint.isActive = true
            lessThanTrailingConstraint.isActive = true
            
            centerYConstraint.isActive = true
            centerXConstraint.isActive = true
            break
        case .centerRight:
            greaterThanTopConstraint.isActive = true
            lessThanBottomConstraint.isActive = true
            greaterThanLeadingConstraint.isActive = true
            trailingConstraint.isActive = true
            
            centerYConstraint.isActive = true
            break
        case .bottomLeft:
            greaterThanTopConstraint.isActive = true
            bottomConstraint.isActive = true
            leadingConstraint.isActive = true
            lessThanTrailingConstraint.isActive = true
            break
        case .bottomCenter:
            greaterThanTopConstraint.isActive = true
            bottomConstraint.isActive = true
            greaterThanLeadingConstraint.isActive = true
            lessThanTrailingConstraint.isActive = true
            
            centerXConstraint.isActive = true
            break
        case .bottomRight:
            greaterThanTopConstraint.isActive = true
            bottomConstraint.isActive = true
            greaterThanLeadingConstraint.isActive = true
            trailingConstraint.isActive = true
            break
        default: /* FILL: */
            topConstraint.isActive = true
            bottomConstraint.isActive = true
            leadingConstraint.isActive = true
            trailingConstraint.isActive = true
            
            heightConstraint?.isActive = false
            widthConstraint?.isActive = false
        break
        }
    }
    
    func loadStyle() {
        
    }
}
