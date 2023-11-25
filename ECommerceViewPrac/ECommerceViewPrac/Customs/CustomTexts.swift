//
//  CustomTexts.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/25/23.
//

import SwiftUI

struct CustomTexts: View {
    var body: some View {
        VStack {
            Text("In Button")
                .modifier(InButton())
        }
    }
}

// MARK: - 버튼 내부
struct InButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .fontWeight(.medium)
    }
}

#Preview {
    CustomTexts()
}
