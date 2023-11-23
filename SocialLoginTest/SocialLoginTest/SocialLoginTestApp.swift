//
//  SocialLoginTestApp.swift
//  SocialLoginTest
//
//  Created by phang on 11/22/23.
//

import SwiftUI
import NaverThirdPartyLogin

@main
struct SocialLoginTestApp: App {
    init() {
        setNaver()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                // SceneDelegate 부분
                .onOpenURL { url in
                    NaverThirdPartyLoginConnection
                        .getSharedInstance()
                        .receiveAccessToken(url)
                }
        }
    }
    
    // AppDelegate 부분
    private func setNaver() {
        let naverInstance = NaverThirdPartyLoginConnection.getSharedInstance()
        // 네이버 앱으로 로그인 허용
        naverInstance?.isNaverAppOauthEnable = true
        // 브라우저 로그인 허용
        naverInstance?.isInAppOauthEnable = true
        // 네이버 로그인 세로모드 고정
        naverInstance?.setOnlyPortraitSupportInIphone(true)
        // NaverThirdPartyConstantsForApp.h에 선언한 상수 등록
        naverInstance?.serviceUrlScheme = kServiceAppUrlScheme
        naverInstance?.consumerKey = kConsumerKey
        naverInstance?.consumerSecret = kConsumerSecret
        naverInstance?.appName = kServiceAppName
    }
}
