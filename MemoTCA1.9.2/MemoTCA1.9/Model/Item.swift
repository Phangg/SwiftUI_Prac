//
//  Item.swift
//  MemoTCA1.9
//
//  Created by phang on 3/20/24.
//

import SwiftUI
import SwiftData

// MARK: - Swift Data 를 사용한, 메모 Item 모델
@Model
final class Item: Equatable, Identifiable {
    let id: UUID
    var timestamp: Date
    var imagesData: [Data] = []
    var content: String
    
    init(id: UUID, timestamp: Date = Date(), content: String) {
        self.id = id
        self.timestamp = timestamp
        self.content = content
    }
}
