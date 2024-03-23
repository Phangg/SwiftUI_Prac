//
//  SwiftDataService.swift
//  MemoTCA1.9
//
//  Created by phang on 3/21/24.
//

import SwiftUI
import SwiftData

import ComposableArchitecture

// MARK: - Swift Data 에 데이터 주고 받는 Service
struct SwiftDataService {
    @Query private var items: [Item]
    
    var fetch: () throws -> [Item]
    var add: (Item) throws -> Void
    var delete: (Item) throws -> Void
    
    enum SwiftDataError: Error {
        case fetchError
        case addError
        case deleteError
    }
}

extension SwiftDataService: DependencyKey {
    static let liveValue = Self(
        fetch: {
            do {
                @Dependency(\.databaseService.context) var context
                let itemContext = try context()
                let descriptor = FetchDescriptor<Item>(sortBy: [SortDescriptor(\.timestamp)])
                return try itemContext.fetch(descriptor)
            } catch {
                throw SwiftDataError.fetchError
            }
        },
        add: { item in
            do {
                @Dependency(\.databaseService.context) var context
                let itemContext = try context()
                itemContext.insert(item)
            } catch {
                throw SwiftDataError.addError
            }
        },
        delete: { item in
            do {
                @Dependency(\.databaseService.context) var context
                let itemContext = try context()
                itemContext.delete(item)
            } catch {
                throw SwiftDataError.deleteError
            }
        }
    )
}
