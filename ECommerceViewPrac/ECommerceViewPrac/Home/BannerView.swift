//
//  BannerView.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/3/23.
//

import SwiftUI

struct BannerView: View {
    let geo: GeometryProxy
    let title: String
    let image: String
    let bgColor: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(bgColor)
            HStack(alignment: .center) {
                Button {
                    // TODO: 이동
                } label: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(title)
                            .modifier(BoldSize18Text(fontColor: .white))
                        HStack {
                            Text("Shop now")
                                .modifier(Size14Text(fontColor: .white))
                                .opacity(0.8)
                            Image(systemName: "arrow.forward")
                                .foregroundStyle(Color.white)
                        }
                    }
                }
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(maxHeight: geo.size.height * 0.2)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal, 25)
    }
}

#Preview {
    GeometryReader { geo in
        BannerView(geo: geo,
                   title: "악세서리 \n모아보기",
                   image: "ecommerce03",
                   bgColor: .customLightGreen)
    }
}
