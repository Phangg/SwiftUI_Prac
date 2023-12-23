//
//  SplashView.swift
//  LooksLike
//
//  Created by phang on 12/21/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("U Look Like")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Text("👾 Made by Phang")
                .foregroundStyle(Color.gray)
                .font(.footnote)
                .padding(.bottom, 20)
        }
        .padding()
    }
}

#Preview {
    SplashView()
}
