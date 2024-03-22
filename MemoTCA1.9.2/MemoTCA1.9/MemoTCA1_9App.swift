//
//  MemoTCA1_9App.swift
//  MemoTCA1.9
//
//  Created by phang on 3/20/24.
//

import SwiftUI
import SwiftData

import ComposableArchitecture

@main
struct MemoTCA1_9App: App {
    //
    static let store = Store(initialState: MainViewFeature.State()) {
        MainViewFeature()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            MainView(store: MemoTCA1_9App.store)
        }
        .modelContainer(for: Item.self)
    }
}
