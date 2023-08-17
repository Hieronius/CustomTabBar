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
        setupTabBar()
        setTabBarAppearance()
    }
    
    // MARK: - Private Methods
    
    private func setupTabBar() {
        viewControllers = [
            setupVC(viewController: MenuScreenVC(), title: "Menu", image: UIImage(named: "pizzaIcon")),
            setupVC(viewController: ProfileScreenVC(), title: "Profile", image: UIImage(named: "profileIcon")),
            setupVC(viewController: ContactsScreenVC(), title: "Contacts", image: UIImage(named: "contactsIcon")),
            setupVC(viewController: BasketScreenVC(), title: "Basket", image: UIImage(named: "basketIcon"))
            ]
    }
    
    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: positionOnX,
                                y: tabBar.bounds.minY - positionOnY,
                                width: width,
                                height: height),
                                cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }


}

