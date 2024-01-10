//
//  TextNameSpace.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import Foundation

enum Texts {
    static let loginGreetings = "Hello \n--------- !"
    static let login = "로그인"
    static let email = "이메일"
    static let password = "비밀번호"
    static let emailPlaceHolder = "이메일을 입력해주세요."
    static let passwordPlaceHolder = "비밀번호를 입력해주세요."
    static let emailHelperText = "이메일을 올바르게 입력해주세요."
    static let passwordHelperTextUnable = "Unable - 8자 이상"
    static let passwordHelperTextBad = "Unable - 문자 + 숫자 + 특수문자 추천"
    static let passwordHelperTextWeak = "Weak - 특수문자 추천"
    static let passwordHelperTextFine = "Fine - 특수문자 추가 추천"
    static let passwordHelperTextExcellent = "Excellent"
}

enum Numbers {
    static let backgroungRectHeightRatio = 0.85
    static let passwordProgressCellWidthRatio = 0.25
}
