//
//  VerificationView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/26/23.
//

import SwiftUI

struct VerificationView: View {
    private var code: [Int] = []
    private var clickableNextButton: Bool {
        !code.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Verification")
                .modifier(LargeText())
                .padding(.bottom, 20)
            Text("번호로 인증 코드를 보냈어요! \n인증 번호를 확인해주세요")
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
                    ForEach(1...4, id: \.self) { num in
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(minWidth: 75, maxWidth: .infinity, maxHeight: 50)
                            .background(Color.offGray)
                            .cornerRadius(10)
                            .overlay {
                                Text("\(num)")
                                    .modifier(BodyText(fontColor: .navyBlack))
                            }
                    }
//                    ForEach(code, id: \.self) { codeNum in
//                        Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(minWidth: 75, maxWidth: .infinity, maxHeight: 50)
//                            .background(Color.offGray)
//                            .cornerRadius(10)
//                            .overlay {
//                                Text("\(codeNum)")
//                                    .modifier(BodyText(fontColor: .navyBlack))
//                            }
//                    }
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
