//
//  Database.swift
//  MemoTCA1.9
//
//  Created by phang on 3/21/24.
//

import Foundation
import SwiftData

import ComposableArchitecture

// MARK: - Model Context
fileprivate let itemModelContext: ModelContext = {
    let schema = Schema([
        Item.self,
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    do {
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        return ModelContext(container)
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()


// MARK: - SwiftData 를 사용한 Database
struct Database {
    var context: () throws -> ModelContext
}

extension Database: DependencyKey {
    public static let liveValue = Self(
        context: { itemModelContext }
    )
}
