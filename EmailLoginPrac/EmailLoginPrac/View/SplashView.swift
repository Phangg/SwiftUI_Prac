//
//  SplashView.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("✨")
                .font(.system(size: 150))
            Text("---------")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            VStack(spacing: 0) {
                Text("👾 2024, --------- all rights reserved.")
                    .font(.footnote)
                    .foregroundStyle(.customGray)
                Text("Powered by Phang")
                    .font(.footnote)
                    .foregroundStyle(.customGray)
            }
        }
    }
}

#Preview {
    SplashView()
}
