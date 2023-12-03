//
//  CommerceData.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/3/23.
//

import SwiftUI

struct CommerceData: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let deadline: String
    
    static let commerceDummyData: [CommerceData] = [
        CommerceData(image: "commerce01", name: "오픈 이벤트 \n배송비 무료!", deadline: "2024년 1월까지"),
        CommerceData(image: "commerce02", name: "블랙 프라이데이 \n70% 할인", deadline: "2023년 12월까지")
    ]
}
