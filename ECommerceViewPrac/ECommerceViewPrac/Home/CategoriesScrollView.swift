//
//  CategoriesScrollView.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/3/23.
//

import SwiftUI

struct CategoriesScrollView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Categories")
                    .modifier(BoldSize18Text(fontColor: .navyBlack))
                Spacer()
                Button {
                    // TODO: category 전체 보기
                } label: {
                     Text("See All")
                        .modifier(Size14Text(fontColor: .mainBlue))
                }
            }
            .padding(.horizontal, 25)
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(CategoryData.categoryDummyData) { data in
                        CustomCategoryGridCell(categoryImage: data.image,
                                               categoryName: data.name,
                                               backgroundColor: data.bgColor,
                                               iconColor: data.iconColor)
                    }
                }
                .padding(.horizontal, 15)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CategoriesScrollView()
}
