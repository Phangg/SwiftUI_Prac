//
//  VerificationView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/26/23.
//

import SwiftUI

struct VerificationView: View {
    @State private var code: [String] = ["", "", "", ""]
    private var clickableNextButton: Bool {
        !code.contains("")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Verification")
                .modifier(LargeText())
                .padding(.bottom, 20)
            Text("번호로 인증 코드를 보냈어요! \n인증 번호를 입력해주세요")
                .modifier(BodyText(fontColor: .darkGray))
                .padding(.bottom, 70)
            HStack {
                Text("Verification Code")
                    .modifier(BodyText(fontColor: .navyBlack))
                Spacer()
                Button {
                    // TODO: 인증번호 재 전송
                } label: {
                    Text("Re-send Code")
                        .modifier(BodyText(fontColor: .mainBlue))
                }
            }
            .padding(.bottom, 20)
            Grid(horizontalSpacing: 10) {
                GridRow {
                    ForEach(0..<4, id: \.self) { idx in
                        GrayTextField(text: $code[idx],
                                      placeHolder: "",
                                      textFieldType: .large)
                        .keyboardType(.numberPad)
                    }
                }
            }
            .padding(.bottom, 20)
            HStack {
                Text("남은 시간")
                    .modifier(BodyText(fontColor: .darkGray))
                Spacer()
                Text("2:58")
                    .modifier(BodyText(fontColor: .darkGray))
            }
            .padding(.bottom, 70)
            Button {
                // TODO: 인증번호 맞으면 다음 페이지 이동 - 틀리면 alert
                if clickableNextButton {
                }
            } label: {
                Text("다음")
                    .modifier(InButton())
            }
            .buttonStyle(.filled(with: clickableNextButton ? Color.mainBlue : Color.darkGray))
            .disabled(!clickableNextButton)
            Spacer()
            Spacer()
        }
        .padding(25)
    }
}

#Preview {
    VerificationView()
}
