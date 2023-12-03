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
                ForEach(CommerceData.commerceDummyData) { data in
                    CustomCommerceGridCell(geo: geo,
                                           imageString: data.image,
                                           eventName: data.name,
                                           deadline: data.deadline)
                }
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
