//
//  RGBButton.swift
//  RGBMatcher
//
//  Created by Courtney Davis on 7/18/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

class RGBButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(title: String, color: UIColor) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 8
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addBorder(withColor color: UIColor, withWidth width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
