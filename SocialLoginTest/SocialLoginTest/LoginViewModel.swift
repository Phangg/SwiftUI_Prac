//
//  LoginViewModel.swift
//  SocialLoginTest
//
//  Created by phang on 11/23/23.
//

import SwiftUI
import UIKit
import NaverThirdPartyLogin

class LoginViewModel: NSObject, ObservableObject {
    @Published var isLogin = false // token 을 가지고 있는지 프로퍼티 래퍼 생성하는게 맞을 듯
    @Published var platform: LoginPlatform?
    @Published var name = ""
    @Published var email = ""
    @Published var profileImage: String? = nil
    @Published var mobile: String? = nil
    
    enum LoginPlatform: String {
        case apple
        case google
        case kakao
        case naver
        
        var name: String {
            return rawValue.capitalized
        }
    }
    
    func getUserInfo() {
        Task {
            do {
                let data = try await NetworkManager().getNaverInfo()
                DispatchQueue.main.async {
                    self.platform = .naver
                    self.name = data.response.name
                    self.email = data.response.email
                    if let profileImage = data.response.profileImage {
                        self.profileImage = profileImage
                    }
                    if let mobile = data.response.mobile {
                        self.mobile = mobile
                    }
                }
            } catch {
                // TODO: 에러 처리
            }
        }
    }
}

extension LoginViewModel : UIApplicationDelegate,
                           NaverThirdPartyLoginConnectionDelegate{
    // 로그인(토큰 발급) 성공
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("[Success] : Success Naver Login")
        getUserInfo()
        isLogin = true
    }
    // 토큰 갱신
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        getUserInfo()
        isLogin = true
    }
    // 로그아웃(토큰 삭제)
    func oauth20ConnectionDidFinishDeleteToken() {
        platform = nil
        isLogin = false
        print("[Success] : Success Naver Logout")
    }
    // Error 발생
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        platform = nil
        isLogin = false
        // TODO: alert 띄워야 함
        print("[Error] : \(error.localizedDescription)")
    }
}
