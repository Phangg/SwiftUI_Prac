//
//  UserData.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import Foundation

// 유저 리스트
struct AppUsers {
    var users: [AppUser] = [AppUser.lee, AppUser.phang]
}

// 유저
struct AppUser: Identifiable {
    let id: UUID
    let email: String
    var password: String
    var userName: String
    
    init(id: UUID = UUID(), email: String, password: String, userName: String = UUID().description) {
        self.id = id
        self.email = email
        self.password = password
        self.userName = userName
    }
}


// 테스트용 유저 데이터
extension AppUser {
    static let lee: AppUser = AppUser(email: "lee@apple.com", password: "happyswift1!", userName: "lee")
    static let phang: AppUser = AppUser(email: "phang@apple.com", password: "bonjourswift1!", userName: "Phang")
}
