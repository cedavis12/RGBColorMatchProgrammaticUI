//
//  HomeView.swift
//  RGBMatcher
//
//  Created by Courtney  on 8/10/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

@objc protocol HomeButtonDelegate: class {
    func freePlayPressed(_ sender: UIButton)
    func beatClockPressed(_ sender: UIButton)
    func tutorialPressed(_ sender: UIButton)
}

class HomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Logo Image
    let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.frame = .zero
        
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //MARK: Title Label
    let titleLabel: UILabel = {
        let label = UILabel()
        let rgbText = NSMutableAttributedString(string: "RGB Color Match")
        rgbText.addAttribute(.foregroundColor, value: UIColor.systemRed, range: NSRange(location: 0, length: 1))
        rgbText.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: NSRange(location: 1, length: 1))
        rgbText.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: NSRange(location: 2, length: 1))
        rgbText.addAttribute(.foregroundColor, value: UIColor.systemIndigo, range: NSRange(location: 4, length: 11))
        label.attributedText = rgbText
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.90
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: Free Play Button
    let freePlayButton: RGBButton = {
        let button = RGBButton(title: "Free Play", color: .systemBackground)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.addBorder(withColor: .systemIndigo, withWidth: 1.0)
        button.addTarget(self, action: #selector(HomeButtonDelegate.freePlayPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Beat the Clock Button
    let beatClockButton: RGBButton = {
        let button = RGBButton(title: "Beat the Clock", color: .systemBackground)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.addBorder(withColor: .systemIndigo, withWidth: 1.0)
        button.addTarget(self, action: #selector(HomeButtonDelegate.beatClockPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Tutorial Button
    let tutorialButton: RGBButton = {
        let button = RGBButton(title: "How to Play", color: .systemBackground)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.addBorder(withColor: .systemIndigo, withWidth: 1.0)
        button.addTarget(self, action: #selector(HomeButtonDelegate.tutorialPressed), for: .touchUpInside)
        return button
    }()
    
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25.0
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    //MARK: Layout Constraints
    fileprivate func layoutUI() {
        buttonStack.addArrangedSubViews(freePlayButton, beatClockButton, tutorialButton)
        self.addSubViews(logo, titleLabel, buttonStack)
        
        for button in buttonStack.arrangedSubviews {
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 300),
            logo.widthAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 42),
            
            buttonStack.topAnchor.constraint(lessThanOrEqualTo: titleLabel.bottomAnchor, constant: 65),
            buttonStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            buttonStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            buttonStack.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
}
