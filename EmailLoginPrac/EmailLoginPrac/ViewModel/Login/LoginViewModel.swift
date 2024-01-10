//
//  LoginViewModel.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    // 비밀번호 오류 시, 안내 텍스트
    @Published var passwordHelperText: String = Texts.passwordHelperTextUnable
    // 이메일 양식 Bool
    @Published var isValidEmail = false
    // 비밀번호 양식 Bool
    @Published var isValidPassword = false
    // 비밀번호 visible On Off
    @Published var showPassword = false
    // 비밀번호 양식 상태 컬러 값
    @Published var progressColorData: [Color] = Array(repeating: .customGray, count: 4)
    // 알림 띄우기 Bool
    @Published var isShowAlert = false
    // 알림 메세자
    @Published var alertMessage: String = ""
   
    // 이메일 텍스트 지우기
    func cleanEmailText() {
        email = ""
    }
    
    // 비밀번호 텍스트 지우기 + 상태 컬러 초기화 + 알림 메세지
    func cleanPasswordText() {
        password = ""
        progressColorData = [.customGray, .customGray, .customGray, .customGray]
        if alertMessage != LoginError.wrongPassword.message {
            cleanEmailText()
        }
    }
    
    // 이메일 양식 체크
    func checkEmailForm() {
        isValidEmail = email.wholeMatch(of: Constants.emailRegex) != nil
    }
    
    // 비밀번호 양식 체크
    func checkPasswordForm() {
        // excellent
        if password.wholeMatch(of: Constants.excellentPasswordRegex) != nil {
            progressColorData = [.customRed, .customOrange, .customOrange, .customGreen]
            isValidPassword = true
            passwordHelperText = Texts.passwordHelperTextExcellent
        // fine
        } else if password.wholeMatch(of: Constants.finePasswordRegex) != nil {
            progressColorData = [.customRed, .customOrange, .customOrange, .customGray]
            isValidPassword = true
            passwordHelperText = Texts.passwordHelperTextFine
        // weak
        } else if password.wholeMatch(of: Constants.weakPasswordRegex) != nil {
            progressColorData = [.customRed, .customOrange, .customGray, .customGray]
            isValidPassword = true
            passwordHelperText = Texts.passwordHelperTextWeak
        // bad
        } else if password.wholeMatch(of: Constants.badPasswordRegex) != nil {
            progressColorData = [.customRed, .customGray, .customGray, .customGray]
            isValidPassword = false
            passwordHelperText = Texts.passwordHelperTextBad
        // unable
        } else {
            progressColorData = [.customGray, .customGray, .customGray, .customGray]
            isValidPassword = false
            passwordHelperText = Texts.passwordHelperTextUnable
        }
    }
}
