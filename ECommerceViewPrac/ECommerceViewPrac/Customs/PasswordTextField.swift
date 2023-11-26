//
//  PasswordTextField.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/26/23.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var showPassword: Bool
    @Binding var passwordText: String
    
    var body: some View {
        HStack {
            if showPassword {
                TextField(text: $passwordText) {
                    Text("비밀번호를 입력해주세요")
                        .modifier(BodyText(fontColor: .halfGray))
                }
            } else {
                SecureField(text: $passwordText) {
                    Text("비밀번호를 입력해주세요")
                        .modifier(BodyText(fontColor: .halfGray))
                }
            }
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundStyle(Color.darkGray)
            }
        }
        .modifier(CustomTextField())
    }
}

#Preview {
    PasswordTextField(showPassword: .constant(false), passwordText: .constant(""))
}
