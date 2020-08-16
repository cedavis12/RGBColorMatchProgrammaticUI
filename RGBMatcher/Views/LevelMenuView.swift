//
//  LevelMenu.swift
//  RGBMatcher
//
//  Created by Courtney Davis on 8/16/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

@objc protocol LevelButtonDelegate: class {
    func easyLevelPressed(_ sender: UIButton)
    func mediumLevelPressed(_ sender: UIButton)
    func hardLevelPressed(_ sender: UIButton)
}

class LevelMenuView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Easy Button
    let easyButton: RGBButton = {
        let button = RGBButton(title: "Easy", color: .systemBackground)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addBorder(withColor: .systemGreen, withWidth: 1.0)
        button.addTarget(self, action: #selector(LevelButtonDelegate.easyLevelPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Medium Button
    let mediumButton: RGBButton = {
        let button = RGBButton(title: "Medium", color: .systemBackground)
        button.addBorder(withColor: .systemOrange, withWidth: 1.0)
        button.setTitleColor(.systemOrange, for: .normal)
        button.addTarget(self, action: #selector(LevelButtonDelegate.mediumLevelPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Hard Button
    let hardButton: RGBButton = {
        let button = RGBButton(title: "Hard", color: .systemBackground)
        button.setTitleColor(.systemRed, for: .normal)
        button.addBorder(withColor: .systemRed, withWidth: 1.0)
        button.addTarget(self, action: #selector(LevelButtonDelegate.hardLevelPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Button Stack
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40.0
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    //MARK: Layout UI
    fileprivate func layoutUI() {
        self.addSubview(buttonStack)
        buttonStack.addArrangedSubViews(easyButton, mediumButton, hardButton)
        
        for button in buttonStack.arrangedSubviews {
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 55)
            ])
        }
        
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 65),
            buttonStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            buttonStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            buttonStack.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
}

