//
//  UIView+Extensions.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/8/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func noAutoResizing() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    func stretchFullWidth(ofParent: UIView) {
//        self.widthAnchor.constraint(equalTo: ofParent.widthAnchor).isActive = true
//    }
    
    func addSubviewToEntireView(childView : UIView) {
        self.addSubview(childView)
        childView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        childView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        childView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        childView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    func addSubviewToEntireView(childView : UIView, paddingTop : CGFloat, paddingBottom : CGFloat, paddingLeft : CGFloat, paddingRight : CGFloat) {
        self.addSubview(childView)
        childView.topAnchor.constraint(equalTo: self.topAnchor, constant: paddingTop).isActive = true
        childView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -paddingBottom).isActive = true
        childView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: paddingLeft).isActive = true
        childView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -paddingRight).isActive = true
    }
    
    func addSubViewAtCenterXY (subView : UIView) {
        self.addSubview(subView)
        subView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    
}
