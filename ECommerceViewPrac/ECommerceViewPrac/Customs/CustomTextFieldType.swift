//
//  CustomTextFieldType.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/26/23.
//

import SwiftUI

// MARK: - TextField Type
enum TextFieldType {
    case normal
    case large
}

// MARK: - Modifier
struct CustomTextField: ViewModifier {
    let textFieldType: TextFieldType
    
    func body(content: Content) -> some View {
        switch textFieldType {
        case .normal:
            return content
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.offGray)
                .clipShape(.rect(cornerRadius: 10))
        case .large:
            return content
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .frame(minWidth: 75, maxWidth: .infinity, maxHeight: 60, alignment: .center)
                .background(Color.offGray)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}
