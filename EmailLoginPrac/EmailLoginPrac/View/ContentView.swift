//
//  ContentView.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    // user 뷰 모델
    @EnvironmentObject private var userViewModel: UserViewModel
    // splashView 를 넘기는 체크
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            // 처음 로딩
            if isLoading {
                SplashView()
            // 로그인 안했을 때,
            } else if !userViewModel.isLogin {
                LoginView()
            // 로그인 했을 때,
            } else {
                MainView()
            }
        }
        // 1초동안 splashView 보기
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isLoading = false
            }
        }
    }
}

//#Preview {s
//    ContentView()
//        .environmentObject(UserViewModel())
//}
