//
//  MyRoundedButtons.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/8/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation
import UIKit

class MyRoundedButtons : UIButton {
    
    // MARK:- Init methods
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    //MARK:- Properties
    var buttonLabel: String? {
        didSet {
            self.setTitle(buttonLabel, for: .normal)
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            alpha = self.isEnabled ? 1.0 : 0.5
        }
    }
    
    
    //MARK:- Setup
    func setup() {
        self.noAutoResizing()
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 20
        
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
    }
}
