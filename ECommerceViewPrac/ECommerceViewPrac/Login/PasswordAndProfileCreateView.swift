//
//  PasswordAndProfileCreateView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/27/23.
//

import SwiftUI

struct PasswordAndProfileCreateView: View {
    @State private var nameText: String = ""
    @State var passwordText = ""
    @State var showPassword = false
    private var clickablNextButton: Bool {
        !nameText.isEmpty && isPossiblePassword
    }
    private var isPossiblePassword: Bool {
        guard let _ = passwordText.wholeMatch(of: Constants.passwordRegex) else { return false }
        return true
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Profile & Password")
                .modifier(LargeText())
                .padding(.top, 60)
                .padding(.bottom, 20)
            Text("사용하실 이름과 비밀번호를 등록해주세요")
                .modifier(BodyText(fontColor: .darkGray))
                .padding(.bottom, 50)
            Text("Name")
                .padding(.bottom, 10)
            GrayTextField(text: $nameText,
                          placeHolder: "사용하실 이름을 적어주세요",
                          textFieldType: .normal)
            .padding(.bottom, 30)
            Text("Password")
                .padding(.bottom, 10)
            PasswordTextField(showPassword: $showPassword,
                              passwordText: $passwordText)
            .padding(.bottom, 10)
            HStack {
                Image(systemName: "info.circle")
                    .modifier(BodyText(fontColor: isPossiblePassword ? .clear : .darkGray))
                Text("8자 이상 - 숫자 1개, 특수문자 1개 포함")
                    .modifier(BodyText(fontColor: isPossiblePassword ? .clear : .darkGray))
            }
            Spacer()
            Button {
                // TODO: next view 이동
            } label: {
                Text("가입하기")
                    .modifier(InButton())
            }
            .buttonStyle(.filled(with: clickablNextButton ? Color.mainBlue : Color.darkGray))
            .disabled(!clickablNextButton)
            .padding(.bottom, 30)
        }
        .padding(25)
    }
}

#Preview {
    PasswordAndProfileCreateView()
}
