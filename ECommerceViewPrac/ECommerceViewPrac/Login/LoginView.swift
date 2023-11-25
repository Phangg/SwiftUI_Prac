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
        ZStack {
            VStack(alignment: .leading) {
                Spacer()
                Text("Welcome to Mega Mall")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.navyBlack)
                    .frame(width: 200)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                Text("로그인을 위해 데이터를 입력해주세요")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundStyle(Color.darkGray)
                    .padding(.bottom, 50)
                Text("Email / Phone")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.navyBlack)
                    .padding(.bottom, 10)
                HStack {
                    TextField(text: $emailText) {
                        Text("이메일 혹은 핸드폰 번호를 입력해주세요")
                            .font(.system(size: 16))
                            .foregroundStyle(Color.halfGray)
                    }
                    .textInputAutocapitalization(.never)
                    if !emailText.isEmpty {
                        Button(action: {
                            removeText(type: "email")
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(Color.darkGray)
                        }
                    }
                }
                .modifier(CustomTextField())
                .padding(.bottom, 30)
                Text("Password")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.navyBlack)
                    .padding(.bottom, 10)
                
                HStack {
                    if showPassword {
                        TextField(text: $passwordText) {
                            Text("비밀번호를 입력해주세요")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.halfGray)
                        }
                    } else {
                        SecureField(text: $passwordText) {
                            Text("비밀번호를 입력해주세요")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.halfGray)
                        }
                    }
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(Color.darkGray)
                    }
                }
                .modifier(CustomTextField())
                .padding(.bottom, 70)
                    
                Button {
                    // TODO: 로그인
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
                            .font(.system(size: 16))
                            .foregroundStyle(Color.navyBlack)
                    }
                    Spacer()
                    Button {
                        // TODO: 회원 가입
                    } label: {
                        Text("Sign Up")
                            .font(.system(size: 16))
                            .foregroundStyle(Color.mainBlue)
                    }
                }
            }
            .padding()
            //            if isActive {
            //                LoginDialog(isActive: $isActive)
            //            }
        }
    }
    
    private func removeText(type: String) {
        if type == "email" {
            emailText = ""
        } else if type == "password" {
            passwordText = ""
        }
    }
}

#Preview {
    LoginView()
}
