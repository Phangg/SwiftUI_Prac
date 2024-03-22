//
//  NumberFactClient.swift
//  TutoralTCA
//
//  Created by phang on 3/13/24.
//

import Foundation

import ComposableArchitecture

// MARK: - Number Fact Client : Dependency 커스텀을 위한 구조체 선언
struct NumberFactClient {
    var fetch: (Int) async throws -> String
}

// API 로 String 값 받아오는.. 
extension NumberFactClient: DependencyKey {
    static let liveValue = Self(
        fetch: { number in
            let (data, _) = try await URLSession.shared
                .data(from: URL(string: "http://numbersapi.com/\(number)")!)
            return String(decoding: data, as: UTF8.self)
        }
    )
}

// MARK: - Dependency 커스텀
extension DependencyValues {
    var numberFact: NumberFactClient {
        get { self[NumberFactClient.self] }
        set { self[NumberFactClient.self] = newValue }
    }
}
