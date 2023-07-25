//
//  TabBarController.swift
//  UIKit Starter
//
//  Created by Vignesh on 19/07/23.
//

import Foundation

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let translucentColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        tabBar.barTintColor = translucentColor
        tabBar.items?[0].title = "First Tab"
    }
}

