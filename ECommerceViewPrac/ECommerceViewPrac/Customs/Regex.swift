//
//  Regex.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/27/23.
//

import SwiftUI

// MARK: - email, password REGEX
enum Constants {
    // email
    static let emailRegex = /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}/
    // 8 자 이상 & 숫자 1개 이상 & 특수문자 1개 이상
    static let passwordRegex = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}/
}
