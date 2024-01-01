//
//  ProfileActionButtonView.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/2/24.
//

import SwiftUI

struct ProfileActionButtonView: View {
    var isCurrentUser = false
    var isFollowed = false
    
    var body: some View {
        if isCurrentUser {
            
            // Edit Profile
            Button {
                //
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
        } else {
            HStack {
                
                // Follow
                Button {
                    //
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 170, height: 32)
                        .foregroundStyle(isFollowed ? .black : .white)
                        .background(isFollowed ? .white : .blue)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(isFollowed ? .gray : .blue, lineWidth: 1)
                        }
                }
                
                // Message
                Button {
                    //
                } label: {
                    Text("Message")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 170, height: 32)
                        .foregroundStyle(.black)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }
            }
        }
    }
}

#Preview {
    ProfileActionButtonView()
}
