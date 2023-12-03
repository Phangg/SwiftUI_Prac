//
//  ProductScrollView.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/3/23.
//

import SwiftUI

struct ProductScrollView: View {
    let title: String
    let dummyData: [ProductData]
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(title)
                    .modifier(BoldSize18Text(fontColor: .navyBlack))
                Spacer()
                Button {
                    // TODO: 전체 보기
                } label: {
                    Text("See All")
                        .modifier(Size14Text(fontColor: .mainBlue))
                }
            }
            .padding(.horizontal, 25)
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(dummyData) { data in
                        CustomProductGridCell(isSale: data.isSale,
                                              discountRate: data.discountRate,
                                              itemImage: data.itemImage,
                                              itemName: data.itemName,
                                              itemPrice: data.itemPrice,
                                              itemScore: data.itemScore,
                                              itemReviewCount: data.itemReviewCount)
                    }
                }
                .padding(.horizontal, 25)
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    ZStack {
        Color.offGray
            .ignoresSafeArea()
        ProductScrollView(title: "Featured Product",
                          dummyData: ProductData.featuredProductDummyData)
    }
}
