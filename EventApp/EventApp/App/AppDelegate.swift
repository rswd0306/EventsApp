//
//  AppDelegate.swift
//  EventApp



import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK:- Variable Declaration
    
    var window : UIWindow?
    
    //MARK:- App delegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().barTintColor = navigationColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        return true
    }

   
}

