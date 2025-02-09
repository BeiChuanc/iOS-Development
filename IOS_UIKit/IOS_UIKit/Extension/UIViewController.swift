//
//  UIViewController.swift
//  IOS_UIKit
//
//  Created by 北川 on 2025/2/9.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Current UIViewController
    static func currentViewController(baseView: UIViewController? = nil) -> UIViewController? {
        let skipController = baseView ?? UIApplication.currentKeyWindow?.rootViewController
        
        if let UINav = skipController as? UINavigationController {
            return currentViewController(baseView: UINav.visibleViewController)
        } else if let UITab = skipController as? UITabBarController {
            return currentViewController(baseView: UITab.selectedViewController)
        } else if let preVC = skipController?.presentedViewController {
            return currentViewController(baseView: preVC)
        }
        
        return skipController
    }
    
}
