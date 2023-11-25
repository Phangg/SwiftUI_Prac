//
//  ButtonStyle + .swift
//  ECommerceViewPrac
//
//  Created by phang on 11/25/23.
//

import SwiftUI

// MARK: - ButtonStyle 커스텀 추가

extension ButtonStyle where Self == GhostButton {
    static var ghost: Self {
        return .init()
    }
}

extension ButtonStyle where Self == FilledButton {
    static func filled(with color: Color) -> Self {
        return FilledButton(color: color)
    }
}
