//
//  VerificationView.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/26/23.
//

import SwiftUI

struct VerificationView: View {
    enum VerificationCodeField {
        case num1
        case num2
        case num3
        case num4
        case noneFocus
    }

    @State private var verificationCodes: [String] = ["", "", "", ""]
    @State private var remainingTime = 180
    @State private var showingAlert = false
    @FocusState private var focusField: VerificationCodeField?
    private let timerInterval = 1.0
    private var timerString: String {
        let minutes = remainingTime / 60
        let seconds = remainingTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    private var clickableNextButton: Bool {
        !verificationCodes.contains { $0.isEmpty }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Verification")
                .modifier(LargeText(fontColor: .navyBlack))
                .padding(.bottom, 20)
            Text("번호로 인증 코드를 보냈어요! \n인증 번호를 입력해주세요")
                .modifier(BodyText(fontColor: .darkGray))
                .padding(.bottom, 70)
            HStack {
                Text("Verification Code")
                    .modifier(BodyText(fontColor: .navyBlack))
                Spacer()
                Button {
                    resendCode()
                } label: {
                    Text("Re-send Code")
                        .modifier(BodyText(fontColor: .mainBlue))
                }
            }
            .padding(.bottom, 20)
            Grid(horizontalSpacing: 10) {
                GridRow {
                    ForEach(verificationCodes.indices, id: \.self) { idx in
                        GrayTextField(text: $verificationCodes[idx],
                                      placeHolder: "",
                                      textFieldType: .large)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .focused($focusField, equals: getVerificationCodeField(idx))
                        .onChange(of: verificationCodes[idx]) { (_, newValue) in
                            if newValue.count > 1 {
                                verificationCodes[idx] = String(newValue.prefix(1))
                            }
                            if newValue.count == 1 {
                                focusField = getNextFocus(idx) ?? .none
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 20)
            HStack {
                Text("남은 시간")
                    .modifier(BodyText(fontColor: .darkGray))
                Spacer()
                Text(timerString)
                    .modifier(BodyText(fontColor: .darkGray))
            }
            .padding(.bottom, 70)
            Button {
                if clickableNextButton {
                    // TODO: 인증번호 맞으면 다음 페이지 이동 - 틀리면 showingAlert = true
                }
            } label: {
                Text("다음")
                    .modifier(InButton())
            }
            .buttonStyle(.filled(with: clickableNextButton ? Color.mainBlue : Color.darkGray))
            .disabled(!clickableNextButton)
            .alert("인증번호가 맞지 않아요 \n새로운 코드를 보냈어요", isPresented: $showingAlert) {
                Button("돌아가기", role: .cancel) {
                    showingAlert = false
                    resendCode()
                    verificationCodes = ["", "", "", ""]
                }
            }
            Spacer()
            Spacer()
        }
        .padding(25)
        .onAppear {
            startTimer()
        }
    }
    
    private func getVerificationCodeField(_ index: Int) -> VerificationCodeField? {
        switch index {
        case 0:
            return .num1
        case 1:
            return .num2
        case 2:
            return .num3
        case 3:
            return .num4
        default:
            return nil
        }
    }
    
    private func getNextFocus(_ index: Int) -> VerificationCodeField? {
        switch index {
        case 0:
            return .num2
        case 1:
            return .num3
        case 2:
            return .num4
        case 3:
            return nil
        default:
            return nil
        }
    }
    
    private func startTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                // TODO: 인증 시간 지남 ( 로직은 구상 필요 )
            }
        }
    }
    
    private func resendCode() {
        // TODO: 인증번호 새로 보내기
        remainingTime = 180
        startTimer()
    }
}

#Preview {
    VerificationView()
}
