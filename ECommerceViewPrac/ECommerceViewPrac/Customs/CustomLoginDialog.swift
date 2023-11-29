//
//  CustomLoginDialog.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/25/23.
//

import SwiftUI

struct LoginDialog: View {
    @State private var offset: CGFloat = 1000
    @Binding var isActive: Bool
    private let title = "Login Account"
    private let mainMessage = "로그인이 필요해요"
    private let subMessage = "거래를 하려면\n 먼저 로그인 / 회원가입을 해주세요"
    private let buttonTitle = "로그인"
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.15)
                .onTapGesture {
                    closeDialog()
                }
            VStack(spacing: 20) {
                HStack(alignment: .center) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        closeDialog()
                    } label: {
                        Image(systemName: "xmark")
                            .frame(width: 24, height: 24)
                    }
                    .tint(Color.navyBlack)
                }
                Divider()
                Image("hi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(.vertical, 10)
                Text(mainMessage)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subMessage)
                    .font(.body)
                    .foregroundStyle(Color.darkGray)
                    .multilineTextAlignment(.center)
                ZStack {
                    Button {
                        // TODO: Login Action
                    } label: {
                        Text(buttonTitle)
                    }
                    .buttonStyle(.filled(with: Color.mainBlue))
                }
                .padding()
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 25)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private func closeDialog() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}

#Preview {
    LoginDialog(isActive: .constant(true))
}
