//
//  Formatter.swift
//  MemoTCA1.9
//
//  Created by phang on 3/21/24.
//

import Foundation

enum Formatter {
    // date 형식을 string 으로 변환
    static func dateToString(date: Date) -> String {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy.MM.dd"  // 변환할 형식
        let dateString = myFormatter.string(from: date)
        return dateString
    }
}
