//
//  NetworkManager.swift
//  SocialLoginTest
//
//  Created by phang on 11/23/23.
//

import SwiftUI
import NaverThirdPartyLogin

class NetworkManager {
    // HTTP
    enum HttpMethod: String {
        case get
        case post
        
        var method: String {
            return rawValue.uppercased()
        }
    }
    private let naverLoginAPIURL = "https://openapi.naver.com/v1/nid/me"
    private let naverInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    // Naver 로그인 정보 받아오기
    func getNaverInfo() async throws -> NaverLoginResponse {
        // TODO: 에러 분류
        guard let isValidAccessToken = await naverInstance?.isValidAccessTokenExpireTimeNow() else {
            throw Errors.todo
        }
        // TODO: 에러 분류
        guard isValidAccessToken else {
            throw Errors.todo
        }
        // TODO: 에러 분류
        guard let tokenType = await naverInstance?.tokenType else {
            throw Errors.todo
        }
        // TODO: 에러 분류
        guard let accessToken = await naverInstance?.accessToken else {
            throw Errors.todo
        }
        // url check
        let urlString = naverLoginAPIURL
        guard let url = URL(string: urlString) else {
            throw Errors.invalidURL
        }
        // request
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.method
        request.setValue("\(tokenType) \(accessToken)", forHTTPHeaderField: "Authorization")
        // urlSession
        let (data, response) = try await URLSession.shared.data(for: request)
        // response check
        guard let urlResponse = response as? HTTPURLResponse else {
            throw Errors.invalidResponse
        }
        // status code check
        if !(200..<300).contains(urlResponse.statusCode) {
            throw Errors.invalidStatusCode
        }
        // response
        let responseModel = try JSONDecoder().decode(NaverLoginResponse.self, from: data)
        return responseModel
    }
}
