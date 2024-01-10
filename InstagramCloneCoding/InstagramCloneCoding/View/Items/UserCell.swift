//
//  UserCell.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/1/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // 이미지
            Image("cat")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(.circle)
            // 유저 이름
            VStack(alignment: .leading) {
                Text("cat")
                    .font(.system(size: 14,weight: .semibold))
                Text("cat..cute..cat..")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

#Preview {
    UserCell()
}
