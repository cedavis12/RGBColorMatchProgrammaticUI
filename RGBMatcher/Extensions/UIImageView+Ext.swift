//
//  UIImageView+Ext.swift
//  RGBMatcher
//
//  Created by Courtney  on 8/7/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

extension UIImageView {

    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
