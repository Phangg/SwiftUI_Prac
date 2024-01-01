//
//  ProfileHeaderView.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/2/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                // 사진
                Image("cat")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
                    .clipShape(.circle)
                    .padding(.leading)
                
                Spacer()
                
                // post, follow 정보
                HStack {
                    Spacer()
                    UserStatView(value: 1, title: "Posts")
                    Spacer()
                    UserStatView(value: 2, title: "Followers")
                    Spacer()
                    UserStatView(value: 4, title: "Following")
                    Spacer()
                }
            }
            
            // 이름, 설명
            Text("cat..cute..cat..")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            Text("Fxxxing cute cat. Cat is All.")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 2)
            
            // 버튼
            HStack {
                Spacer()
                ProfileActionButtonView()
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    ProfileHeaderView()
}
