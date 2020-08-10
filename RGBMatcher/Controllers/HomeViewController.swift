//
//  HomeViewController.swift
//  RGBMatcher
//
//  Created by Courtney Davis on 7/18/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: SubClassed View 
    var subView = HomeView()
    
    //MARK: LifeCycle Events
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func loadView() {
        view = subView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

//MARK: Home Button Target Actions
extension HomeViewController: HomeButtonDelegate {
    func freePlayPressed(_ sender: UIButton) {
        let destVC = FreePlayViewController()
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func beatClockPressed(_ sender: UIButton) {
        let destVC = BeatTheClockViewController()
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tutorialPressed(_ sender: UIButton) {
        let destVC = TutorialViewController()
        navigationController?.pushViewController(destVC, animated: true)
    }
}
