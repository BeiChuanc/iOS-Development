//
//  PageControlRoute.swift
//  IOS_UIKit
//
//  Created by 北川 on 2025/2/9.
//

import Foundation
import UIKit

// MARK: Global Routing.
class PageControlRoute: NSObject {
    
    // WELCOME | Tips: Parameters can be expanded.
    class func goWelcome(_ window: UIWindow) {
        var vc = UIViewController.currentViewController() as? WelcomeController
        if vc == nil {
            if window.rootViewController != nil {
                window.rootViewController = nil
            }
            vc = WelcomeController()
            let rootVc = UINavigationController(rootViewController: vc!)
            window.rootViewController = rootVc
        }
    }
    
    // TABBAR
    class func goTabBar(_ window: UIWindow) {
        
    }
    
}
