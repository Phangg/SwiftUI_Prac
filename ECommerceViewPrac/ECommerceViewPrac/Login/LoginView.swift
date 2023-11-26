//
//  LoginView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/25/23.
//

import SwiftUI

struct LoginView: View {
    //    @State var isActive: Bool = true
    @State var emailText = ""
    @State var passwordText = ""
    @State var showPassword = false
    private var clickableLoginButton: Bool {
        !self.emailText.isEmpty && !self.passwordText.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Welcome to \nMega Mall")
                        .modifier(LargeText())
                        .padding(.bottom, 20)
                    Text("로그인을 위해 데이터를 입력해주세요")
                        .modifier(BodyText(fontColor: .darkGray))
                        .padding(.bottom, 50)
                    Text("Email / Phone")
                        .modifier(BodyText(fontColor: .navyBlack))
                        .padding(.bottom, 10)
                    GrayTextField(text: $emailText,
                                  placeHolder: "이메일 혹은 핸드폰 번호를 입력해주세요",
                                  textFieldType: .normal)
                        .padding(.bottom, 30)
                    Text("Password")
                        .modifier(BodyText(fontColor: .navyBlack))
                        .padding(.bottom, 10)
                    PasswordTextField(showPassword: $showPassword,
                                      passwordText: $passwordText)
                        .padding(.bottom, 70)
                    Button {
                        // TODO: 로그인 로직 검증 후 다음 페이지
                        if clickableLoginButton {
                            
                        }
                    } label: {
                        Text("로그인")
                            .modifier(InButton())
                    }
                    .buttonStyle(.filled(with: clickableLoginButton ? Color.mainBlue : Color.darkGray))
                    .disabled(!clickableLoginButton)
                    Spacer()
                    HStack {
                        Button {
                            // TODO: 비밀번호 찾기
                        } label: {
                            Text("Forgot Password")
                                .modifier(BodyText(fontColor: .navyBlack))
                        }
                        Spacer()
                        Button {
                            // TODO: 회원 가입
                        } label: {
                            Text("Sign Up")
                                .modifier(BodyText(fontColor: .mainBlue))
                        }
                    }
                }
                .padding(.horizontal, 25)
                //            if isActive {
                //                LoginDialog(isActive: $isActive)
                //            }
            }
        }
    }
}

#Preview {
    LoginView()
}
