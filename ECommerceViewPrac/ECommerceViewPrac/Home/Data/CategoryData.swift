//
//  CategoryData.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/3/23.
//

import SwiftUI

struct CategoryData: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var bgColor: Color
    var iconColor: Color
    
    static let categoryDummyData: [CategoryData] = [
        CategoryData(image: "Foods", name: "Foods", bgColor: .offGreen, iconColor: .customGreen),
        CategoryData(image: "Gift", name: "Gift", bgColor: .offRed, iconColor: .customRed),
        CategoryData(image: "Fashion", name: "Fashion", bgColor: .offYellow, iconColor: .customYellow),
        CategoryData(image: "Gadget", name: "Gadget", bgColor: .offPurple, iconColor: .customPurple),
        CategoryData(image: "Fashion", name: "Computer", bgColor: .offYellow, iconColor: .offYellow),
        CategoryData(image: "Gadget", name: "Souvenir", bgColor: .offPurple, iconColor: .offPurple)
    ]
}
