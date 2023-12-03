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
                    VStack(spacing: 20) {
                        GrayTextField(text: $searchText, placeHolder: "Search Product Name", textFieldType: .normal)
                            .padding(.horizontal, 25)
                        CommerceScrollView(geo: geo)
                        Text("ssadasf")
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
