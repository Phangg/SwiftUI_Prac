//
//  MainTabView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/29/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("HOME")
                }
                .tag(0)
            Text("WishList")
                .tabItem {
                    Image(systemName: "heart")
                    Text("HOME")
                }
                .tag(1)
            Text("Order")
                .tabItem {
                    Image(systemName: "bag")
                    Text("ORDER")
                }
                .tag(2)
            Text("Account")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("ACCOUNT")
                }
                .tag(3)
        }
        .tint(Color.mainBlue)
    }
}

#Preview {
    MainTabView()
}
