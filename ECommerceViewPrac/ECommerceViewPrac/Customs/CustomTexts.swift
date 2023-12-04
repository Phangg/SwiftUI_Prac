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
                .modifier(LargeText(fontColor: .navyBlack))
            Text("Bold Size 18 Text")
                .modifier(BoldSize18Text(fontColor: .navyBlack))
            Text("Body Text")
                .modifier(BodyText(fontColor: .darkGray))
            Text("Medium Size 14 Text")
                .modifier(MediumSize14Text(fontColor: .darkGray))
            Text("Size 14 Text")
                .modifier(Size14Text(fontColor: .darkGray))
            Text("Round Background Text")
                .modifier(RoundBackgroundText(fontColor: .customGreen, backgroundColor: .offGreen))
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
    let fontColor: Color
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(fontColor)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Font Size 18 & Bold
struct BoldSize18Text: ViewModifier {
    let fontColor: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundStyle(fontColor)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Font Size 16 & Align - leading
struct BodyText: ViewModifier {
    let fontColor: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundStyle(fontColor)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Font Size 14 & Medium
struct MediumSize14Text: ViewModifier {
    let fontColor: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .fontWeight(.medium)
            .foregroundStyle(fontColor)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Font Size 14
struct Size14Text: ViewModifier {
    let fontColor: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundStyle(fontColor)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Font Size 12 & RoundBackgroundText
struct RoundBackgroundText: ViewModifier {
    let fontColor: Color
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .padding(.horizontal, 10)
            .padding(.vertical, 2)
            .frame(height: 20, alignment: .trailing)
            .foregroundStyle(fontColor)
            .multilineTextAlignment(.center)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CustomTexts()
}
