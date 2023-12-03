//
//  CustomProductGridCell.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/27/23.
//

import SwiftUI

struct CustomProductGridCell: View {
    let isSale: Bool
    let discountRate: Double
    let itemImage: String
    let itemName: String
    let itemPrice: Int
    let itemScore: Double
    let itemReviewCount: Int
    private var salePrice: Int {
        guard isSale else { return 0 }
        return itemPrice - Int(Double(itemPrice) * discountRate)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(itemImage)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                .overlay(alignment: .bottomLeading) {
                    if isSale {
                        Text("SALE")
                            .modifier(RoundBackgroundText(fontColor: .white, backgroundColor: .red))
                    }
                }
            VStack(alignment: .leading) {
                Text(itemName)
                    .modifier(MediumSize14Text(fontColor: .navyBlack))
                if !isSale {
                    Text("\(itemPrice)원")
                        .modifier(MediumSize14Text(fontColor: .red))
                } else {
                    Text("\(salePrice)원")
                        .modifier(MediumSize14Text(fontColor: .red))
                    Text("\(itemPrice)원")
                        .modifier(Size14Text(fontColor: .halfGray))
                        .strikethrough(true, color: Color.halfGray)
                }
                HStack(spacing: 0) {
                    Image("star")
                        .frame(width: 12, height: 12)
                        .padding(.trailing, 2)
                    Text(getFormattedStringNum(itemScore))
                        .modifier(Size14Text(fontColor: .navyBlack))
                        .padding(.trailing, 5)
                    Text("\(itemReviewCount) Reviews")
                        .modifier(Size14Text(fontColor: .navyBlack))
                        .padding(.trailing, 10)
                    Button {
                        // TODO: 제품 상세 이동
                    } label: {
                         Image(systemName: "ellipsis")
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundStyle(Color.darkGray)
                    }
                }
                .padding(.top, 5)
            }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 10)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 10))
    }
    
    private func getFormattedStringNum(_ score: Double) -> String {
        String(format: "%.1f", score)
    }
}

#Preview {
    ZStack {
        Color.black
            .opacity(0.2)
            .ignoresSafeArea()
        CustomProductGridCell(
            isSale: true,
//            isSale: false,
            discountRate: 0.3333333333333333,
            itemImage: "ecommerce01",
            itemName: "TMA-2 HD Wireless",
            itemPrice: 150_000,
            itemScore: 4.6,
            itemReviewCount: 86)
    }
}
