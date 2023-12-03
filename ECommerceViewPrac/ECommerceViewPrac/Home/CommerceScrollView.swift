//
//  CommerceScrollView.swift.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/30/23.
//

import SwiftUI

struct CommerceScrollView: View {
    let geo: GeometryProxy

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                CustomCommerceGridCell(geo: geo,
                                       imageString: "commerce01",
                                       eventName: "오픈 이벤트 \n배송비 무료!",
                                       deadline: "2024년 1월까지")
                CustomCommerceGridCell(geo: geo,
                                       imageString: "commerce02",
                                       eventName: "블랙 프라이데이 \n70% 할인",
                                       deadline: "2023년 12월까지")
            }
            .padding(.horizontal, 25)
            .frame(maxHeight: geo.size.height * 0.2)
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    GeometryReader { geo in
        CommerceScrollView(geo: geo)
    }
}
