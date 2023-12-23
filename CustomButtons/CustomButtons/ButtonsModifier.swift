//
//  ButtonsModifier.swift
//  CustomButtons
//
//  Created by phang on 12/23/23.
//

import SwiftUI

struct FilledButton: ViewModifier {
    let fontColor: Color
    let backgroundColor: Color
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(fontColor)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: height)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 15))
    }
}

struct BorderButton: ViewModifier {
    let color: Color
    let height: CGFloat

    func body(content: Content) -> some View {
        content
            .foregroundStyle(color)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: height)
            .clipShape(.rect(cornerRadius: 15))
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(color)
            }
    }
}

struct DashedBorderButton: ViewModifier {
    let color: Color
    let height: CGFloat

    func body(content: Content) -> some View {
        content
            .foregroundStyle(color)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: height)
            .clipShape(.rect(cornerRadius: 15))
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(color, style: StrokeStyle(lineWidth: 1, dash: [10]))
            }
    }
}

struct TextWrappedButton: ViewModifier {
    let fontColor: Color
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(fontColor)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 15))
    }
}

struct IconButton: ViewModifier {
    let fontColor: Color
    let backgroundColor: Color
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(fontColor)
            .frame(width: size, height: size)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 15))
    }
}

struct CircleIconButton: ViewModifier {
    let fontColor: Color
    let backgroundColor: Color
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(fontColor)
            .frame(width: size, height: size)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: size / 2))
    }
}

struct LinkButton: ViewModifier {
    let color: Color
    let height: CGFloat

    func body(content: Content) -> some View {
        content
            .foregroundStyle(color)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: height)
            .underline(true)
    }
}

