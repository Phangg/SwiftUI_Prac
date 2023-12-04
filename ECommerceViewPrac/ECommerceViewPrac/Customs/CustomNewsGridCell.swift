//
//  CustomNewsGridCell.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/4/23.
//

import SwiftUI

struct CustomNewsGridCell: View {
    let title: String
    let subTitle: String
    let dateString: String
    let image: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .modifier(BodyText(fontColor: .navyBlack))
                    .fontWeight(.medium)
                Text(subTitle)
                    .modifier(Size14Text(fontColor: .navyBlack))
                    .lineLimit(1)
                Text(dateString)
                    .modifier(Size14Text(fontColor: .darkGray))
            }
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 10))
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        Color.black
            .opacity(0.2)
            .ignoresSafeArea()
        CustomNewsGridCell(title: "Philosophy That Addresses Topics Such As Goodness",
                           subTitle: "Agar tetap kinclong, bodi motor ten...",
                           dateString: "13 Jan 2021",
                           image: "news01")
            .background(Color.white)
    }
}
