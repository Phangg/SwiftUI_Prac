//
//  EmailAndPassword.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct EmailAndPassword: View {
    // login 뷰 모델
    @EnvironmentObject private var loginViewModel: LoginViewModel
    // 이메일, 비밀번호 입력 창 focus 상태
    @FocusState var focusedField: FocusField?
    // 비밀번호 검증 progress 컬럼
    private let progressColumn: [GridItem] = [
        GridItem(.flexible()), GridItem(.flexible()),
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - email
            
            Text(Texts.email)
                .font(.system(size: 14))
                .foregroundStyle(.customMainText)
            // email 텍스트 필드
            HStack {
                TextField("", text: $loginViewModel.email,
                          prompt: Text(Texts.emailPlaceHolder)
                                        .foregroundColor(.customGray)) // iOS 17.0 에서 foregroundStyle 로 변경
                    .foregroundStyle(.customMainText)
                    .focused($focusedField, equals: .email)
                    .textInputAutocapitalization(.never)
                    .onChange(of: loginViewModel.email) { _ in
                        loginViewModel.checkEmailForm()
                    }
                // 입력 시, 지우는 버튼 on
                if !loginViewModel.email.isEmpty {
                    Button {
                        loginViewModel.cleanEmailText()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .modifier(EmailAndPasswordTextField(focused: focusedField == .email))
            // 입력 시, 양식 경고 텍스트
            Text(Texts.emailHelperText)
                .font(.system(size: 14))
                .foregroundStyle(
                    !loginViewModel.email.isEmpty && !loginViewModel.isValidEmail ? Color.customRed : Color.clear
                )
                .padding(.bottom, 10)
            
            // MARK: - password
            
            Text(Texts.password)
                .font(.system(size: 14))
                .foregroundStyle(.customMainText)
            // password 텍스트 or 시큐어 필드
            HStack {
                // 텍스트 필드 (비밀번호 보이게)
                if loginViewModel.showPassword {
                    TextField("", text: $loginViewModel.password,
                              prompt: Text(Texts.passwordPlaceHolder)
                                            .foregroundColor(.customGray)) // iOS 17.0 에서 foregroundStyle 로 변경
                        .foregroundStyle(.customMainText)
                        .focused($focusedField, equals: .password)
                        .textInputAutocapitalization(.never)
                        .onChange(of: loginViewModel.password) { _ in
                            loginViewModel.checkPasswordForm()
                        }
                        .disabled(!loginViewModel.isValidEmail)
                } else {
                    // 시큐어 필드 (비밀번호 안보이게)
                    SecureField("", text: $loginViewModel.password,
                                prompt: Text(Texts.passwordPlaceHolder)
                                            .foregroundColor(.customGray)) // iOS 17.0 에서 foregroundStyle 로 변경
                        .foregroundStyle(.customMainText)
                        .focused($focusedField, equals: .password)
                        .textInputAutocapitalization(.never)
                        .onChange(of: loginViewModel.password) { _ in
                            loginViewModel.checkPasswordForm()
                        }
                        .disabled(!loginViewModel.isValidEmail)
                }
                // 비밀번호 보이고 안보이게 하는 이모지 버튼
                Button {
                    loginViewModel.showPassword.toggle()
                } label: {
                    Image(systemName: loginViewModel.showPassword ? "eye.slash" : "eye")
                        .foregroundStyle(.black)
                }
            }
            .modifier(EmailAndPasswordTextField(focused: focusedField == .password))
            // 비밀번호 양식 체크 progress
            LazyVGrid(columns: progressColumn, spacing: 10) {
                ForEach(loginViewModel.progressColorData.indices, id: \.self) { index in
                    VStack {
                        Rectangle()
                            .stroke(loginViewModel.progressColorData[index], lineWidth: 2)
                            .frame(height: 0.5)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            // 입력 시, 양식 경고 텍스트
            Text("\(loginViewModel.passwordHelperText)")
                .font(.system(size: 14))
                .foregroundStyle(!loginViewModel.password.isEmpty ? Color.customRed : Color.clear)
                .padding(.bottom, 20)
        }
        // 엔터 키 입력 시, 각 focus 상태에 따라 focus 이동 및 해제
        .onSubmit {
            switch focusedField {
            case .email:
                focusedField = .password
            case .password:
                focusedField = nil
            default:
                return
            }
        }
    }
}

#Preview {
    EmailAndPassword()
        .environmentObject(LoginViewModel())
}
