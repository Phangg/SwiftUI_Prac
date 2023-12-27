//
//  FeedCell.swift
//  InstagramCloneCoding
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("dog")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .clipShape(.rect(cornerRadius: 18))
                Text("dog")
                    .font(.system(size: 14, weight: .semibold))
            }
            Image("dog")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            HStack(spacing: 8) {
                Button {
                    //
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                }
                Button {
                    //
                } label: {
                    Image(systemName: "bubble")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                }
                Button {
                    //
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                }
            }
            .foregroundStyle(.black)
            
            HStack {
                Text("dog")
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(" ")
                +
                Text("abcd efg higk lmnop qrs tuv wxyz ABCD EFG HIJK LMNOP QRS TUV WXYZ")
                    .font(.system(size: 16))
            }
            Text("2d")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .padding(.top)
        }
    }
}

#Preview {
    FeedCell()
}
