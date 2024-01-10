//
//  LoginButton.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct LoginButton: View {
    // user 뷰 모델
    @EnvironmentObject private var userViewModel: UserViewModel
    // login 뷰 모델
    @EnvironmentObject private var loginViewModel: LoginViewModel
    // 로그인 가능
    private var availableLogin: Bool {
        loginViewModel.isValidEmail && loginViewModel.isValidPassword
    }
    
    var body: some View {
        HStack {
            Button {
                loginViewModel.alertMessage = userViewModel.login(email: loginViewModel.email,
                                                                  password: loginViewModel.password)
                if !userViewModel.isLogin {
                    loginViewModel.isShowAlert = true
                }
            } label: {
                Text(Texts.login)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity)
            }
            .disabled(!availableLogin)
            .alert(loginViewModel.alertMessage,
                   isPresented: $loginViewModel.isShowAlert,
                   actions: {
                Button("OK", role: .cancel) {
                    loginViewModel.cleanPasswordText()
                }
            })
        }
        .padding(.vertical, 12)
        .background(availableLogin ? Color.customAccent : Color.customGray)
        .cornerRadius(10)
    }
}

#Preview {
    LoginButton()
        .environmentObject(UserViewModel())
        .environmentObject(LoginViewModel())
}
