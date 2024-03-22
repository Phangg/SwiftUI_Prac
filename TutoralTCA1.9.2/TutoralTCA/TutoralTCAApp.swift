//
//  TutoralTCAApp.swift
//  TutoralTCA
//
//  Created by phang on 3/13/24.
//

import SwiftUI

import ComposableArchitecture

@main
struct TutoralTCAApp: App {
    // 앱 전체에서 사용되는 Store 를 선언
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
            ._printChanges() // 변화가 일어날 때 마다, 출력
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: TutoralTCAApp.store)
                .tint(.orange)
        }
    }
}
