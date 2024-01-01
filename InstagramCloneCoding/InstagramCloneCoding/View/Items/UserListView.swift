//
//  UserListView.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/1/24.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<20) { _ in
                    UserCell()
                        .padding(.leading)
                }
            }
        }
    }
}

#Preview {
    UserListView()
}
