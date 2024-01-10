//
//  LoginView.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct LoginView: View {
    // login 뷰 모델
    @EnvironmentObject private var loginViewModel: LoginViewModel
    // 이메일, 비밀번호 입력 창 focus 상태
    @FocusState var focusedField: FocusField?

    var body: some View {
        VStack {
            Spacer()
            // 뒷 배경
            BackgroudRectangle()
                .overlay {
                    VStack(alignment: .leading) {
                        // 앱 이름 "---------" 인사말
                        Text(Texts.loginGreetings)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(Color.customMainText)
                            .padding(.vertical, 40)
                        // 이메일, 패스워드 입력
                        EmailAndPassword(focusedField: _focusedField)
                        // 로그인 버튼
                        LoginButton()
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .background(Color.customBackground)
                    .padding(20)
                }
        }
        // hide keyboard - 키보드 내리기
        .onTapGesture {
            focusedField = nil
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
