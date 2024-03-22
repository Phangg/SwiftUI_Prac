//
//  DependencyValues +.swift
//  MemoTCA1.9
//
//  Created by phang on 3/21/24.
//

import SwiftUI

import ComposableArchitecture

extension DependencyValues {
    // database
    var databaseService: Database {
        get { self[Database.self] }
        set { self[Database.self] = newValue }
    }
    
    // swiftdata
    var swiftData: SwiftDataService {
        get { self[SwiftDataService.self] }
        set { self[SwiftDataService.self] = newValue }
    }
    
    // image convert
    var imageService: ImageService {
        get { self[ImageService.self] }
        set { self[ImageService.self] = newValue }
    }
}
