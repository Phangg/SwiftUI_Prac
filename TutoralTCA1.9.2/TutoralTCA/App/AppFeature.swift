//
//  AppFeature.swift
//  TutoralTCA
//
//  Created by phang on 3/14/24.
//

import Foundation

import ComposableArchitecture

// MARK: - AppFeature Reducer
@Reducer
struct AppFeature {
    // 탭바에서 사용될 각각의 Reducer 의 State
    struct State: Equatable {
        var tab1 = CounterFeature.State()
        var tab2 = CounterFeature.State()
        var tab3 = ContactsFeature.State()
    }
    // 탭바에서 사용될 각각의 Reducer 의 Action
    enum Action {
        case tab1(CounterFeature.Action)
        case tab2(CounterFeature.Action)
        case tab3(ContactsFeature.Action)
    }
    
    // 상위인 AppFeature 에서 하위의 Feature 들을 사용
    var body: some ReducerOf<Self> {
        Scope(state: \.tab1, action: \.tab1) {
            CounterFeature()
        }
        Scope(state: \.tab2, action: \.tab2) {
            CounterFeature()
        }
        Scope(state: \.tab3, action: \.tab3) {
            ContactsFeature()
        }
        Reduce { state, action in
            return .none
        }
    }
}
