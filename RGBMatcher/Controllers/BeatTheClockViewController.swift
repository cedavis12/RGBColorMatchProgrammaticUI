//
//  BeatTheClockViewController.swift
//  RGBMatcher
//
//  Created by Courtney Davis on 7/18/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

class BeatTheClockViewController: UIViewController {
    
    var subView = LevelMenuView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.configureNavBar(withTitle: "Beat the Clock")
    }
    
    override func loadView() {
        view = subView
    }
}

extension BeatTheClockViewController: LevelButtonDelegate {
    func easyLevelPressed(_ sender: UIButton) {
        print("Easy button pressed")
    }
    
    func mediumLevelPressed(_ sender: UIButton) {
        print("Medium button pressed")
    }
    
    func hardLevelPressed(_ sender: UIButton) {
        print("Hard button pressed")
    }
}
