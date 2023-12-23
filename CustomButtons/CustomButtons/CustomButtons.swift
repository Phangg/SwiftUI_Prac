//
//  CustomButtons.swift
//  CustomButtons
//
//  Created by phang on 12/23/23.
//

import SwiftUI

struct RadioButton: View {
    @State var isActive = false
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(.black.opacity(isActive ? 1 : 0))
                .frame(width: 14, height: 14)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 20, height: 20)
                }
            
            Text("Radio Button")
        }
        .onTapGesture {
            withAnimation {
                isActive.toggle()
            }
        }
    }
}

struct CheckmarkButton: View {
    @State var isActive = false
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: isActive ? "checkmark.square.fill" : "")
                .resizable()
                .frame(width: 18, height: 18)
                .cornerRadius(2)
                .overlay {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(.clear)
                        .stroke(.black, style: StrokeStyle(lineWidth: 2))
                        .frame(width: 18, height: 18)
                }
            
            Text("Checkmark Button")
        }
        .onTapGesture {
            withAnimation {
                isActive.toggle()
            }
        }
    }
}

struct CheckmarkButton2: View {
    @State var isActive = false
    
    var body: some View {
        HStack(spacing: 12) {
            Text("Full Width Checkmark")
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(isActive ? .white : .black)
            
            Spacer()
            
            Image(systemName: isActive ? "checkmark.circle.fill" : "")
                .resizable()
                .foregroundColor(isActive ? .white : .black)
                .frame(width: 24, height: 24)
                .overlay {
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(isActive ? .white : .black)
                }
        }
        .padding(.horizontal, 16)
        .frame(height: 52)
        .background(isActive ? .black : .white)
        .cornerRadius(15)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.black)
        }
        .onTapGesture {
            withAnimation {
                isActive.toggle()
            }
        }
    }
}
