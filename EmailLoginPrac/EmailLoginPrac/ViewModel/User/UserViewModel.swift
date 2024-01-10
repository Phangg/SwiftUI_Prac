//
//  UserViewModel.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import Foundation

final class UserViewModel: ObservableObject {
    // 로그인 유무
    @Published var isLogin = false
    // 로그인 된 유저 이름
    @Published var userName: String?
    
    // 로그인
    func login(email: String, password: String) -> String {
        do {
            // 해당 이메일과 비밀번호가 맞는지 체크
            try confirmSubscriptionAndCorrectPassword(email: email, password: password)
            isLogin = true
            return ""
            // 이메일 오류
        } catch LoginError.wrongEmail {
            isLogin = false
            return LoginError.wrongEmail.message
            // 비밀번호 오류
        } catch LoginError.wrongPassword {
            isLogin = false
            return LoginError.wrongPassword.message
        } catch {
            fatalError("An unknown error occurred")
        }
    }
    
    // 해당 이메일과 비밀번호가 맞는지 체크
    private func confirmSubscriptionAndCorrectPassword(email: String, password: String) throws {
        for user in AppUsers().users {
            if email == user.email {
                if password == user.password {
                    self.userName = user.userName
                    return
                } else {
                    throw LoginError.wrongPassword
                }
            }
        }
        throw LoginError.wrongEmail
    }
}
