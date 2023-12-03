//
//  MainShopView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/29/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                ScrollView {
                    VStack(spacing: 0) {
                        VStack(spacing: 5) {
                            GrayTextField(text: $searchText,
                                          placeHolder: "Search Product Name",
                                          textFieldType: .normal)
                                .padding(.horizontal, 25)
                                .padding(.top, -25)
                            CommerceScrollView(geo: geo)
                            CategoriesScrollView()
                                .padding(.bottom, 20)
                        }
                        VStack {
                        }
                        .background(Color.offGray)
                        .clipShape(.rect(topLeadingRadius: 10,
                                         bottomLeadingRadius: 0,
                                         bottomTrailingRadius: 0,
                                         topTrailingRadius: 10))
                    }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Mega Mall")
                                .modifier(BoldSize18Text(fontColor: .mainBlue))
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                // TODO: Alarm View
                            } label: {
                                Image(systemName: "bell")
                            }
                            .tint(Color.mainBlue)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                // TODO: Cart View
                            } label: {
                                Image(systemName: "cart")
                            }
                            .tint(Color.mainBlue)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
