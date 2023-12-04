//
//  NewsData.swift
//  ECommerceViewPrac
//
//  Created by phang on 12/5/23.
//

import SwiftUI

struct NewsData: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    let dateString: String
    let image: String
    
    static let newsDummyData: [NewsData] = [
        NewsData(title: "지속 가능한 미래를 위한 혁신, 기업들이 채택하는 새로운 전략",
                 subTitle: "환경 친화적 기술과 사회 책임경영으로 미래를 선도하는 기업들의 도전",
                 dateString: "04 Dec 2023",
                 image: "news01"),
        NewsData(title: "디지털 혁명의 중심, 인공지능의 미래와 현재 - 어디까지 갈지는 나도 모르겠지만, 너도 모르겠지.",
                 subTitle: "세계적인 전문가들이 전망하는 AI 기술의 발전과 현대 산업의 디지털 전환",
                 dateString: "03 Dec 2023",
                 image: "news02"),
        NewsData(title: "건강한 라이프스타일을 위한 식품 혁신, 소비자들의 선택이 바뀌고 있다",
                 subTitle: "영양과 맛, 친환경을 고려한 현대식 소비자들의 건강한 식품 선호도 증가",
                 dateString: "02 Dec 2023",
                 image: "news03"),
    ]
}
