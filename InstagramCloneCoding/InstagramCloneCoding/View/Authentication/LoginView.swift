//
//  LoginView.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 배경색
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
                                               startPoint: .top,
                                               endPoint: .bottom)
                .ignoresSafeArea(.all)
                
                VStack {
                    // 로고
                    Image("InstagramLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 220, height: 100)
                    
                    VStack(spacing: 20) {
                        // 이메일
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .modifier(LoginTextField())
                        // 비밀번호
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .modifier(LoginTextField())
                    }
                    
                    HStack {
                        Spacer()
                        // 비밀번호 찾기
                        Button {
                            //
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                    }
                    // 로그인
                    Button {
                        //
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 340, height: 50)
                            .background(.purple.opacity(0.85))
                            .clipShape(.capsule)
                            .padding()
                    }
                    Spacer()

                    // 회원 가입
                    NavigationLink(value: "", label: {
                        HStack(alignment: .lastTextBaseline) {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundStyle(.white)
                    })
                    .padding(.bottom, 16)
                }
                .padding(.top, 24)
            }
            .navigationDestination(for: String.self) { _ in
                RegistrationView()
            }
        }
    }
}

struct LoginTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white.opacity(0.15))
            .clipShape(.rect(cornerRadius: 10))
            .foregroundStyle(.white)
            .padding(.horizontal, 32)
    }
}

#Preview {
    LoginView()
}
