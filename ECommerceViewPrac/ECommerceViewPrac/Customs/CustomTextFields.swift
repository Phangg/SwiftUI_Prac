//
//  CustomTextFields.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/26/23.
//

import SwiftUI

// MARK: -


// MARK: - Modifier
struct CustomTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.offGray)
            .cornerRadius(10)
    }
}
