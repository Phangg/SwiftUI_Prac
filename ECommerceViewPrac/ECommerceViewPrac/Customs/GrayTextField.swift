//
//  GrayTextField.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/26/23.
//

import SwiftUI

// MARK: - 커스텀 텍스트 필드
struct GrayTextField: View {
    @Binding var text: String
    var placeHolder: String
    
    var body: some View {
        HStack {
            TextField(text: $text) {
                Text("이메일 혹은 핸드폰 번호를 입력해주세요")
                    .modifier(BodyText(fontColor: .halfGray))
            }
            .textInputAutocapitalization(.never)
            if !text.isEmpty {
                Button(action: {
                    removeText()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color.darkGray)
                }
            }
        }
        .modifier(CustomTextField())
    }
    private func removeText() {
        self.text = ""
    }
}

#Preview {
    GrayTextField(text: .constant(""),
                  placeHolder: "이메일 혹은 핸드폰 번호를 입력해주세요")
}
