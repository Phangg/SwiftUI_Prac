//
//  CreateAccountView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/27/23.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var emailText = ""
    private var clickablNextButton: Bool {
        !emailText.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Create Accout")
                    .modifier(LargeText())
                    .padding(.top, 60)
                    .padding(.bottom, 20)
                Text("등록한 이메일 혹은 전화번호로 \n인증 번호를 보내드릴 예정이에요")
                    .modifier(BodyText(fontColor: .darkGray))
                    .padding(.bottom, 60)
                Text("Email / Phone")
                    .modifier(BodyText(fontColor: .navyBlack))
                    .padding(.bottom, 10)
                GrayTextField(text: $emailText,
                              placeHolder: "이메일 혹은 핸드폰 번호를 입력해주세요",
                              textFieldType: .normal)
                Spacer()
                Button {
                    // TODO: next view 이동 ( 가입된 아이디 인지 확인 - alert )
                    // next view == VerificationView
                } label: {
                    Text("다음")
                        .modifier(InButton())
                }
                .buttonStyle(.filled(with: clickablNextButton ? Color.mainBlue : Color.darkGray))
                .disabled(!clickablNextButton)
            }
            .padding(.bottom, 100)
            HStack(spacing: 10) {
                Text("Have an Account?")
                    .modifier(BodyText(fontColor: .darkGray))
                Button {
                    // TODO: 다시 로그인 뷰로 이동
                } label: {
                     Text("Sign In")
                        .modifier(BodyText(fontColor: .mainBlue))
                }
            }
        }
        .padding(25)
    }
}

#Preview {
    CreateAccountView()
}
