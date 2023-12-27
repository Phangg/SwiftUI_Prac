//
//  MainTabView.swift
//  InstagramCloneCoding
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, .none)
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .environment(\.symbolVariants, .none)
                }
            UploadPostView()
                .tabItem {
                    Image(systemName: "plus.square")
                        .environment(\.symbolVariants, .none)
                }
            NotificationsView()
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, .none)
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, .none)
                }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
