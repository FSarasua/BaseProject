//
//  UITableView+Extension.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 13/9/23.
//

import Foundation

extension UITableView {
    
    public func registerCells() {
        var nib = UINib(nibName: KNibName.labelCell, bundle: KBundle.baseProject)
        self.register(nib, forCellReuseIdentifier: KCellID.labelCell)
        
        nib = UINib(nibName: KNibName.imageCell, bundle: KBundle.baseProject)
        self.register(nib, forCellReuseIdentifier: KCellID.imageCell)
        
        nib = UINib(nibName: KNibName.imageLabelCell, bundle: KBundle.baseProject)
        self.register(nib, forCellReuseIdentifier: KCellID.imageLabelCell)
        
        nib = UINib(nibName: KNibName.mainCell, bundle: KBundle.baseProject)
        self.register(nib, forCellReuseIdentifier: KCellID.mainCell)
    }
}
