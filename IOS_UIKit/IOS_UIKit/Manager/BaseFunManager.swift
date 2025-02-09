//
//  BaseFunManager.swift
//  IOS_UIKit
//
//  Created by 北川 on 2025/2/9.
//

import Foundation
import UIKit

class BaseFunManager: NSObject {
    
    static let shared: BaseFunManager = BaseFunManager()
    
    private override init() {
        super.init()
    }
    
    func getActualFontName(from fileName: String) -> String? {
        if let fontURL = Bundle.main.url(forResource: fileName, withExtension: "ttf"),
           let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
           let font = CGFont(fontDataProvider) {
            return font.postScriptName as String?
        }
        return nil
    }
    
}
