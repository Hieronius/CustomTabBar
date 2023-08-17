//
//  ViewController.swift
//  CustomTabBar
//
//  Created by Арсентий Халимовский on 17.08.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Methods
    
    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }


}

