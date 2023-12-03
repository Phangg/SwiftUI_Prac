//
//  ProductData.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/3/23.
//

import SwiftUI

struct ProductData: Identifiable {
    let id = UUID()
    let isSale: Bool
    let discountRate: Double
    let itemImage: String
    let itemName: String
    let itemPrice: Int
    let itemScore: Double
    let itemReviewCount: Int
    
    static let featuredProductDummyData: [ProductData] = [
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce03", itemName: "스피커 연결잭",
                    itemPrice: 10_000, itemScore: 4.2, itemReviewCount: 21),
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce02", itemName: "무선 헤드셋",
                    itemPrice: 150_000, itemScore: 4.7, itemReviewCount: 99),
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce03", itemName: "스피커 연결잭 - 10M",
                    itemPrice: 15_000, itemScore: 4.4, itemReviewCount: 45),
    ]
    static let bestSellersDummyData: [ProductData] = [
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce02", itemName: "무선 헤드셋",
                    itemPrice: 150_000, itemScore: 4.7, itemReviewCount: 99),
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce01", itemName: "무선 전동 드릴",
                    itemPrice: 200_000, itemScore: 4.6, itemReviewCount: 86),
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce03", itemName: "스피커 연결잭 - 10M",
                    itemPrice: 15_000, itemScore: 4.4, itemReviewCount: 45),
    ]
    static let newArrivalsDummyData: [ProductData] = [
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce03", itemName: "스피커 연결잭",
                    itemPrice: 10_000, itemScore: 4.2, itemReviewCount: 21),
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce01", itemName: "무선 전동 드릴",
                    itemPrice: 200_000, itemScore: 4.6, itemReviewCount: 86),
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce03", itemName: "스피커 연결잭 - 10M",
                    itemPrice: 15_000, itemScore: 4.4, itemReviewCount: 45),
    ]
    static let topRatedProductDummyData: [ProductData] = [
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce02", itemName: "무선 헤드셋",
                    itemPrice: 150_000, itemScore: 4.7, itemReviewCount: 99),
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce01", itemName: "무선 전동 드릴",
                    itemPrice: 200_000, itemScore: 4.6, itemReviewCount: 86),
        ProductData(isSale: false, discountRate: 0, itemImage: "ecommerce03", itemName: "스피커 연결잭 - 10M",
                    itemPrice: 15_000, itemScore: 4.4, itemReviewCount: 45),
    ]
    static let specialOffersDummyData: [ProductData] = [
        ProductData(isSale: true, discountRate: 0.25, itemImage: "ecommerce01", itemName: "무선 전동 드릴",
                    itemPrice: 200_000, itemScore: 4.6, itemReviewCount: 86),
        ProductData(isSale: true, discountRate: 0.3333333333333333, itemImage: "ecommerce02", itemName: "무선 헤드셋",
                    itemPrice: 150_000, itemScore: 4.7, itemReviewCount: 99),
        ProductData(isSale: true, discountRate: 0.2, itemImage: "ecommerce03", itemName: "스피커 연결잭 - 10M",
                    itemPrice: 15_000, itemScore: 4.4, itemReviewCount: 45),
    ]
}
