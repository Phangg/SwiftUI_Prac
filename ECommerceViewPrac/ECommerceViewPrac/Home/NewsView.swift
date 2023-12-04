//
//  NewsView.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/4/23.
//

import SwiftUI

struct NewsView: View {
    let dummyData: [NewsData]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Latest News")
                .modifier(BoldSize18Text(fontColor: .navyBlack))
                .padding(.top, 20)
            ForEach(dummyData.indices, id: \.self) { idx in
                CustomNewsGridCell(title: dummyData[idx].title,
                                   subTitle: dummyData[idx].subTitle,
                                   dateString: dummyData[idx].dateString,
                                   image: dummyData[idx].image)
                if idx < dummyData.count - 1 {
                    Divider()
                }
            }
            Button {
                // TODO: 뉴스 더보기
            } label: {
                Text("See All News")
            }
            .buttonStyle(.ghost)
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    NewsView(dummyData: NewsData.newsDummyData)
}
