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
        setupTabBarIcons()
    }
    
    // MARK: - Private Methods
    
    private func setupTabBar() {
        viewControllers = [
            setupVC(viewController: MenuScreenVC(), title: "Menu", image: UIImage(named: "pizzaIcon1")),
            setupVC(viewController: ProfileScreenVC(), title: "Profile", image: UIImage(named: "profileIcon1")),
            setupVC(viewController: ContactsScreenVC(), title: "Contacts", image: UIImage(named: "contactsIcon1")),
            setupVC(viewController: BasketScreenVC(), title: "Basket", image: UIImage(named: "basketIcon1"))
            ]
    }
    
    private func setupTabBarIcons() {
        // Get a reference to the TabBarItems
        guard let items = tabBar.items else { return }
        
        // Set up the custom images for each TabBarItem
        items[0].selectedImage = UIImage(named: "pizzaSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        items[0].image = UIImage(named: "pizzaIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        
        items[1].selectedImage = UIImage(named: "contactsSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        items[1].image = UIImage(named: "contactsIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        
        items[2].selectedImage = UIImage(named: "profileSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        items[2].image = UIImage(named: "profileIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        
        items[3].selectedImage = UIImage(named: "basketSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        items[3].image = UIImage(named: "basketIcon")?.resize(withSize: CGSize(width: 30, height: 30))
    }
    
    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 15
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
        tabBar.itemSpacing = UIScreen.main.bounds.width/5 - width/5
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }


}

// MARK: - Extensions

extension UIImage {
    func resize(withSize size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image{ _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return resizedImage.withRenderingMode(.alwaysOriginal)
    }
}

