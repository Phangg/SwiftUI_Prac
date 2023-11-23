//
//  LoginView.swift
//  SocialLoginTest
//
//  Created by phang on 11/22/23.
//

import SwiftUI
import NaverThirdPartyLogin

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 56) {
                Image(systemName: "lock.rectangle.stack")
                    .resizable()
                    .aspectRatio(1/1, contentMode: .fit)
                    .frame(width: 100)
                    .foregroundStyle(.gray)
                Text("Social Login Testing App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                LoginButtons()
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.isLogin) {
                MainView()
            }
        }
        .environmentObject(viewModel)
    }
}

struct LoginButtons: View {
    @EnvironmentObject private var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            // Naver 로그인 - 앱 없으면 자동으로 브라우저 사용
            Button {
                NaverThirdPartyLoginConnection
                    .getSharedInstance().delegate = viewModel.self
                NaverThirdPartyLoginConnection
                    .getSharedInstance()
                    .requestThirdPartyLogin()
            } label: {
                Image("naver_login_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding(.horizontal, 80)
    }
}

#Preview {
    LoginView()
}
