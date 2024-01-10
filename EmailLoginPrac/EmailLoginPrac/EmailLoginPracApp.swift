//
//  EmailLoginPracApp.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

@main
struct EmailLoginPracApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserViewModel())
                .environmentObject(LoginViewModel())
        }
    }
}
