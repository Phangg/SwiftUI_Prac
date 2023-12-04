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
                        VStack(spacing: 0) {
                            GrayTextField(text: $searchText,
                                          placeHolder: "Search Product Name",
                                          textFieldType: .normal)
                                .padding(.horizontal, 25)
                                .padding(.top, -25)
                            CommerceScrollView(geo: geo)
                            CategoriesScrollView()
                                .padding(.bottom, 20)
                        }
                        VStack(spacing: 20) {
                            ProductScrollView(title: "Featured Product",
                                              dummyData: ProductData.featuredProductDummyData)
                                .padding(.top, 20)
                            BannerView(geo: geo, title: "스피커 연결잭",
                                       image: "ecommerce03", bgColor: .customLightGreen)
                            ProductScrollView(title: "Best Sellers",
                                              dummyData: ProductData.bestSellersDummyData)
                            BannerView(geo: geo, title: "무선 헤드셋",
                                       image: "ecommerce02", bgColor: .mainBlue)
                            ProductScrollView(title: "New Arrivals",
                                              dummyData: ProductData.newArrivalsDummyData)
                            ProductScrollView(title: "Top Rated Product",
                                              dummyData: ProductData.topRatedProductDummyData)
                            ProductScrollView(title: "Special Offers",
                                              dummyData: ProductData.specialOffersDummyData)
                                .padding(.bottom, 20)                            
                        }
                        .background(Color.offGray)
                        .clipShape(.rect(topLeadingRadius: 10,
                                         bottomLeadingRadius: 0,
                                         bottomTrailingRadius: 0,
                                         topTrailingRadius: 10))
                        NewsView(dummyData: NewsData.newsDummyData)
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
