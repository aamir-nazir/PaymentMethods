//
//  AppDelegate.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppConfig()

        return true
    }
}

//MARK: Helper
extension AppDelegate {
    func setupAppConfig() {
        // background color
        UITabBar.appearance().tintColor = #colorLiteral(red: 0, green: 0.537254902, blue: 0.2509803922, alpha: 1)

        // UI elements on nav bar
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0, green: 0.537254902, blue: 0.2509803922, alpha: 1)

        // Text color
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
