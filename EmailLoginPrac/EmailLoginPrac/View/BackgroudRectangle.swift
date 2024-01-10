//
//  BackgroudRectangle.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct BackgroudRectangle: View {
    var body: some View {
        Rectangle()
            .fill(Color.customBackground)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * Numbers.backgroungRectHeightRatio)
            .clipShape(
                .rect(
                    topLeadingRadius: 30,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 30
                )
            )
    }
}

#Preview {
    VStack {
        Spacer()
        BackgroudRectangle()
    }
    .ignoresSafeArea()
}
