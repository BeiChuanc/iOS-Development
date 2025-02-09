//
//  UIApplication.swift
//  IOS_UIKit
//
//  Created by 北川 on 2025/2/9.
//

import Foundation
import UIKit

extension UIApplication {
    static var currentKeyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .first?.windows
                .first(where: { $0.isKeyWindow })
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
