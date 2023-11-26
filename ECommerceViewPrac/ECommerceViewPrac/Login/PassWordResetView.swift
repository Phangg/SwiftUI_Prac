//
//  PassWordResetView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/26/23.
//

import SwiftUI

struct PassWordResetView: View {
    @State private var emailText = ""
    private var clickablNextButton: Bool {
        !emailText.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Reset Password")
                .modifier(LargeText())
                .padding(.bottom, 20)
            Text("계정과 연결된 이메일 / 전화 번호를 \n입력하여 비밀번호를 재설정해주세요")
                .modifier(BodyText(fontColor: .darkGray))
                .padding(.bottom, 70)
            Text("Email / Phone")
                .modifier(BodyText(fontColor: .navyBlack))
                .padding(.bottom, 10)
            GrayTextField(text: $emailText,
                          placeHolder: "이메일 혹은 핸드폰 번호를 입력해주세요",
                          textFieldType: .normal)
                .padding(.bottom, 60)
            Button {
                // TODO: next view 이동 ( 가입된 아이디 인지 확인 - alert )
            } label: {
                Text("다음")
                    .modifier(InButton())
            }
            .buttonStyle(.filled(with: clickablNextButton ? Color.mainBlue : Color.darkGray))
            .disabled(!clickablNextButton)
            Spacer()
            Spacer()
        }
        .padding(25)
    }
}

#Preview {
    PassWordResetView()
}
