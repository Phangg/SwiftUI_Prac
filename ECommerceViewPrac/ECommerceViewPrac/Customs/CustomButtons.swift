//
//  CustomButtons.swift
//  ECommerceViewPrac
//
//  Created by phang on 11/25/23.
//

import SwiftUI

struct CustomButtons: View {
    var body: some View {
        VStack {
            // Filled Button
            Button {
                print("Filled Button Tapped")
            } label: {
                Text("Filled Button")
                    .modifier(InButton())
            }
            .buttonStyle(.filled)
            // Ghost Button
            Button {
                print("Ghost Button Tapped")
            } label: {
                Text("Ghost Button")
                    .modifier(InButton())
            }
            .buttonStyle(.ghost)
        }
        .padding()
    }
}

// MARK: - 메인 컬러 들어간 Prominent Style
struct FilledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .background(
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.mainBlue)
                .stroke(Color.mainBlue, lineWidth: 1)
            )
            .foregroundStyle(Color.white)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}

// MARK: - GhostButton Style
struct GhostButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        var isRelease: Bool {
            !configuration.isPressed
        }
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .background(
              RoundedRectangle(cornerRadius: 10)
                .stroke(Color.navyBlack, lineWidth: 1)
            )
            .foregroundStyle(Color.navyBlack)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}

#Preview {
    CustomButtons()
}
