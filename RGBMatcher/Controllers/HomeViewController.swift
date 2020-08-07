//
//  HomeViewController.swift
//  RGBMatcher
//
//  Created by Courtney Davis on 7/18/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: LifeCycle Events
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: Logo Image
    let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.frame = .zero
        
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        //        image.layer.shadowColor = UIColor.black.cgColor
        //        image.layer.shadowOpacity = 1
        //        image.layer.shadowOffset = .zero
        //        image.layer.shadowRadius = 10
        //        image.layer.shadowPath = UIBezierPath(rect: image.bounds).cgPath
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
        button.addTarget(self, action: #selector(freePlayPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Beat the Clock Button
    let beatClockButton: RGBButton = {
        let button = RGBButton(title: "Beat the Clock", color: .systemBackground)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.addBorder(withColor: .systemIndigo, withWidth: 1.0)
        button.addTarget(self, action: #selector(beatClockPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Tutorial Button
    let tutorialButton: RGBButton = {
        let button = RGBButton(title: "How to Play", color: .systemBackground)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.addBorder(withColor: .systemIndigo, withWidth: 1.0)
        button.addTarget(self, action: #selector(tutorialPressed), for: .touchUpInside)
        return button
    }()
    
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    //MARK: Layout Constraints
    func layoutUI() {
        buttonStack.addArrangedSubViews(freePlayButton, beatClockButton, tutorialButton)
        view.addSubViews(logo, titleLabel, buttonStack)
        
        for button in buttonStack.arrangedSubviews {
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 300),
            logo.widthAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 42),
            
            buttonStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            buttonStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
    //MARK: Button Target Actions
    @objc func freePlayPressed() {
        let destVC = FreePlayViewController()
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    @objc func beatClockPressed() {
        let destVC = BeatTheClockViewController()
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    @objc func tutorialPressed() {
        let destVC = TutorialViewController()
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
