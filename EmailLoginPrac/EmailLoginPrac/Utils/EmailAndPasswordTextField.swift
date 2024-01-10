//
//  EmailAndPasswordTextField.swift
//  EmailLoginPrac
//
//  Created by phang on 1/11/24.
//

import SwiftUI

struct EmailAndPasswordTextField: ViewModifier {
    // 텍스트 필드 focus 상태
    let focused: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(focused ? Color.customMainText : Color.customGray , lineWidth: 1)
            )
    }
}
