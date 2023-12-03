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
            Button {
                print("Filled Button Tapped")
            } label: {
                HStack {
                    Text("Added")
                        .modifier(InButton())
                    Spacer()
                    Image(systemName: "heart.fill")
                }
            }
            .buttonStyle(.filled(with: Color.red))
            .padding(.horizontal, 120)
            Button {
                print("Filled Button Tapped")
            } label: {
                Text("Filled Button")
                    .modifier(InButton())
            }
            .buttonStyle(.filled(with: Color.mainBlue))
            Button {
                print("Filled Button Tapped")
            } label: {
                Text("Filled Button")
                    .modifier(InButton())
            }
            .buttonStyle(.filled(with: Color.darkGray))
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

// MARK: - 컬러 들어간 Prominent Style
struct FilledButton: ButtonStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .stroke(color, lineWidth: 1)
            )
            .foregroundStyle(Color.white)
            .clipShape(.rect(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}

// MARK: - GhostButton Style
struct GhostButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .background(
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .stroke(Color.navyBlack, lineWidth: 1)
            )
            .foregroundStyle(Color.navyBlack)
            .clipShape(.rect(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}

#Preview {
    CustomButtons()
}
