//
//  NotificationCell.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/1/24.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = true
    
    var body: some View {
        HStack {
            Image("fox")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(.circle)
            
            Text("cat")
                .font(.system(size: 14, weight: .semibold))
            +
            Text(" liked one of your posts.")
                .font(.system(size: 15))
            Spacer()
            
            if showPostImage {
                Image("fox")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipped()
            } else {
                Button {
                    //
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                        .font(.system(size: 14, weight: .semibold))
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
