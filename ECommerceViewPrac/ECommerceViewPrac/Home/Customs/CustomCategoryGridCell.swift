//
//  CustomCategoryGridCell.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/3/23.
//

import SwiftUI

struct CustomCategoryGridCell: View {
    let categoryImage: String
    let categoryName: String
    let backgroundColor: Color
    let iconColor: Color

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .fill(backgroundColor)
                .clipShape(.rect(cornerRadius: 10))
                .frame(width: 50, height: 50)
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                .overlay {
                    Image(categoryImage)
                        .tint(iconColor)
                }
            Text(categoryName)
                .modifier(Size14Text(fontColor: .navyBlack))
        }
    }
}

#Preview {
    CustomCategoryGridCell(categoryImage: "Foods",
                           categoryName: "Foods",
                           backgroundColor: .offGreen,
                           iconColor: .customGreen)
}
