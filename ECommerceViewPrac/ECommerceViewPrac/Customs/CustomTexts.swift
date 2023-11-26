//
//  CustomTexts.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/25/23.
//

import SwiftUI

struct CustomTexts: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("In Button")
                .modifier(InButton())
            Text("Large Text")
                .modifier(LargeText())
            Text("Body Text")
                .modifier(BodyText(fontColor: .darkGray))
        }
    }
}

// MARK: - 버튼 내부
struct InButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .fontWeight(.medium)
    }
}

// MARK: - Large & Bold
struct LargeText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.navyBlack)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Font Size 16 & Align - leading
struct BodyText: ViewModifier {
    var fontColor: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundStyle(fontColor)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    CustomTexts()
}
