//
//  HideKeyBoard.swift
//  IOS_UI
//
//  Created by 北川 on 2025/2/20.
//

import Foundation
import SwiftUI

extension View {
    func hidekeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
