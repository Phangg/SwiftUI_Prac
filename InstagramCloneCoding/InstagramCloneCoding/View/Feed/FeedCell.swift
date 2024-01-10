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
            
            // 유저 정보
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
            .padding([.leading, .bottom], 8)
            
            // 이미지
            Image("dog")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            // 좋아요, 댓글, 공유 버튼
            HStack(spacing: 16) {
                Button {
                    //
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(4)
                }
                Button {
                    //
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(4)
                }
                Button {
                    //
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(4)
                }
            }
            .padding(.leading, 4)
            .foregroundStyle(.black)
            
            // 좋아요 개수
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 4)

            // 유저 네임 + 글
            HStack {
                Text("dog")
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(" ")
                +
                Text("abcd efg higk lmnop qrs tuv wxyz ABCD EFG HIJK LMNOP QRS TUV WXYZ")
                   .font(.system(size: 16))
            }
            .padding(.horizontal, 8)
            
            // 업로드 시간
            Text("2d")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}

#Preview {
    FeedCell()
}
