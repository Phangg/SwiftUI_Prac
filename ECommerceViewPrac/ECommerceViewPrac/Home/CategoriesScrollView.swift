//
//  CategoriesScrollView.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/3/23.
//

import SwiftUI

struct CategoriesScrollView: View {
    let geo: GeometryProxy

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                Text("")
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
        CategoriesScrollView(geo: geo)
    }
}
