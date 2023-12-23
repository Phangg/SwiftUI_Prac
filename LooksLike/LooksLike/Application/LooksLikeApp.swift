//
//  LooksLikeApp.swift
//  LooksLike
//
//  Created by phang on 12/21/23.
//

import SwiftUI

@main
struct LooksLikeApp: App {
    @State private var isLoading = true
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if isLoading {
                    SplashView()
                } else {
                    StartingView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                }
            }
        }
    }
}
