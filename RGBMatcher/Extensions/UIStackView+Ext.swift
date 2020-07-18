//
//  UIStackView+Ext.swift
//  RGBMatcher
//
//  Created by Courtney Davis on 7/18/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubViews(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}
