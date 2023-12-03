//
//  CustomCommerceGridCell.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/2/23.
//

import SwiftUI

struct CustomCommerceGridCell: View {
    let geo: GeometryProxy
    let imageString: String
    let eventName: String
    let deadline: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(imageString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 10))
                    .frame(maxHeight: geo.size.height * 0.2)
            }
            Rectangle()
                .foregroundStyle(Color.clear)
                .background(Color.mainBlue)
                .clipShape(.rect(topLeadingRadius: 10,
                                 bottomLeadingRadius: 10,
                                 bottomTrailingRadius: 100,
                                 topTrailingRadius: 100))
                .frame(minWidth: 0, maxWidth: geo.size.width * 0.53, maxHeight: geo.size.height * 0.2)
                .overlay(alignment: .center) {
                    VStack(spacing: 10) {
                        Text(eventName)
                            .modifier(BoldSize18Text(fontColor: .white))
                        Text(deadline)
                            .modifier(Size14Text(fontColor: .white))
                    }
                    .padding(.trailing, 20)
                }
        }
        .frame(minWidth: geo.size.width - 50, maxHeight: geo.size.height * 0.2)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    GeometryReader { geo in
        ZStack {
            Color.white
                .opacity(0.2)
                .ignoresSafeArea()
            CustomCommerceGridCell(geo: geo,
                                   imageString: "commerce01",
                                   eventName: "오픈 이벤트 \n배송비 무료!",
                                   deadline: "2024년 1월까지")
            .padding(.horizontal, 25)
        }
    }
}
