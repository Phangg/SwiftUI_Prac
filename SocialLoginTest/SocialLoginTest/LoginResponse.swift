//
//  LoginResponse.swift
//  SocialLoginTest
//
//  Created by phang on 11/23/23.
//

import SwiftUI

// MARK: - NaverLoginResponse
struct NaverLoginResponse: Decodable {
    let resultcode: String
    let message: String
    let response: UserData
}

// NaverLoginResponse - UserData
struct UserData: Decodable {
    let id: String
    let name: String
    let email: String
    let profileImage: String?
    let mobile: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case profileImage = "profile_image"
        case mobile
    }
//    let nickname: String?
//    let age: String?
//    let gender: String?
//    let birthday: String?
//    let birthyear: String?
}
