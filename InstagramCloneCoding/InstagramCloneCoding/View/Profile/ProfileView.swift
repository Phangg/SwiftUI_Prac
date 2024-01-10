//
//  ProfileView.swift
//  InstagramCloneCoding
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 32) {
            ProfileHeaderView()
            
            PostGridView()
        }
    }
}

#Preview {
    ProfileView()
}
