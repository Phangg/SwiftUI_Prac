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
    let placeHolder: String
    let textFieldType: TextFieldType
    
    var body: some View {
        HStack {
            TextField(text: $text) {
                Text(placeHolder)
                    .modifier(BodyText(fontColor: .halfGray))
            }
            .textInputAutocapitalization(.never)
            if textFieldType == .normal, !text.isEmpty {
                Button(action: {
                    removeText()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color.darkGray)
                }
            }
        }
        .modifier(CustomTextField(textFieldType: textFieldType))
    }
    private func removeText() {
        self.text = ""
    }
}

#Preview {
    VStack {
        GrayTextField(text: .constant("??????"),
                      placeHolder: "이메일 혹은 핸드폰 번호를 입력해주세요",
                      textFieldType: .normal)
    }
    .padding()
}
