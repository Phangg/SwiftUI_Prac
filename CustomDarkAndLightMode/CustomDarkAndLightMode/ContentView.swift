//
//  ContentView.swift
//  CustomDarkAndLightMode
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 40) {
            Circle()
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [isDarkMode ? Color(uiColor: .systemIndigo) : Color.orange,
                                                    isDarkMode ? Color(uiColor: .darkGray) : Color.red]),
                        startPoint: .topTrailing, endPoint: .bottomLeading))
                .frame(width: 150, height: 150)
                .overlay(alignment: .topTrailing) {
                    if !isDarkMode {
                        Circle()
                            .foregroundStyle(.clear)
                            .matchedGeometryEffect(id: "Circle", in: namespace)
                            .frame(width: 0, height: 0)
                            .offset(x: 10, y: 10)
                    } else {
                        Circle()
                            .foregroundStyle(.black)
                            .matchedGeometryEffect(id: "Circle", in: namespace)
                            .frame(width: 115, height: 115)
                            .offset(x: 5, y: -5)
                    }
                }
            
            Toggle("", isOn: $isDarkMode)
                .toggleStyle(CustomToggleStyle())
        }
        .padding(30)
        .background(isDarkMode ? .black : Color(uiColor: .systemGray6))
        .frame(width: 350, height: 300)
        .clipShape(.rect(cornerRadius: 20))
        .shadow(color: .black.opacity(0.15), radius: 10, x: 10, y: 10)
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 200, height: 40)
                .foregroundStyle(configuration.isOn ? Color(uiColor: .systemGray2) : Color(uiColor: .systemGray5))

            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(configuration.isOn ? Color(uiColor: .systemGray) : .white)
                .frame(width: 100, height: 44)
                .offset(x: configuration.isOn ? 50 : -50)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            HStack {
                Text("Light")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundStyle(configuration.isOn ? .gray : .black)
                Spacer()
                Text("Dark")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundStyle(configuration.isOn ? .black : .gray)
            }
            .frame(width: 140)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                configuration.isOn.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
