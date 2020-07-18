//
//  HomeViewController.swift
//  RGBMatcher
//
//  Created by Courtney Davis on 7/18/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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
    
    //create imageview
    let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.frame = .zero
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //create title label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "RGB Color Match"
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 40)

        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.90
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //create free play button
    let freePlayButton: RGBButton = {
        let button = RGBButton(title: "Free Play", color: .systemBackground)
        button.addTarget(self, action: #selector(freePlayPressed), for: .touchUpInside)
        return button
    }()
    
    //create beat the clock button
    let beatClockButton: RGBButton = {
        let button = RGBButton(title: "Beat the Clock", color: .systemBackground)
        button.addTarget(self, action: #selector(beatClockPressed), for: .touchUpInside)
        return button
    }()
    
    //create tutorial button
    let tutorialButton: RGBButton = {
        let button = RGBButton(title: "How to Play", color: .systemBackground)
        button.addTarget(self, action: #selector(tutorialPressed), for: .touchUpInside)
        return button
    }()
    
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    //constrain ui
    func layoutUI() {
        buttonStack.addArrangedSubViews(freePlayButton, beatClockButton, tutorialButton)
        view.addSubViews(logo, titleLabel, buttonStack)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.heightAnchor.constraint(lessThanOrEqualToConstant: 375),
            
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 42),
            
            buttonStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45)
        ])
    }
    
    //button actions
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
