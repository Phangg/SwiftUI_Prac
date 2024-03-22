//
//  AppView.swift
//  TutoralTCA
//
//  Created by phang on 3/14/24.
//

import SwiftUI

import ComposableArchitecture

// MARK: - App View
struct AppView: View {
    // AppFeature 리듀서 도메인의 Store 를 참조
    let store: StoreOf<AppFeature>
    
    var body: some View {
        TabView {
            CounterView(store: store.scope(state: \.tab1, action: \.tab1))
                .tabItem {
                    Text("Counter 1")
                }
            CounterView(store: store.scope(state: \.tab2, action: \.tab2))
                .tabItem {
                    Text("Counter 2")
                }
            ContactsView(store: store.scope(state: \.tab3, action: \.tab3))
                .tabItem {
                    Text("Contacts")
                }
        }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}
