//
//  Celebrity.swift
//  LooksLike
//
//  Created by phang on 12/21/23.
//

import Foundation

// MARK: - response
struct Celebrity: Decodable {
    let info: InfoData
    let faces: [FaceData]
}

struct InfoData: Decodable {
    let size: SizeData
    let faceCount: Int
}

struct SizeData: Decodable {
    let width: Int
    let height: Int
}

struct FaceData: Decodable, Hashable {
    let celebrity: CelebrityData
}

struct CelebrityData: Decodable, Hashable {
    let value: String
    let confidence: Double
}
