//
//  UserStatView.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/2/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            Text(title)
                .font(.system(size: 15))
        }
        .frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStatView(value: 1, title: "Posts")
}
